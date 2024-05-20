library;

import 'dart:async';
import 'dart:isolate';
import 'dart:math';

import 'package:bloc/bloc.dart';

import 'isolate_dispatcher.dart';

typedef CreateBloc<S, E> = Bloc<S, E> Function();

class SendPortMessageToMain extends MessageToMain {
  final SendPort sendPort;

  SendPortMessageToMain({required this.sendPort});
}

class IsolatedBloc<Event, State> implements StateStreamableSource<State> {
  final CreateBloc<Event, State> _createBloc;
  final int _key = _random.nextInt(0x7fffffff);

  final ReceivePort _fromIsolatePort = ReceivePort();
  SendPort? _toIsolatePort;

  static BlocMainIsolateLogic blocMainIsolateLogic = BlocMainIsolateLogic();

  static Random _random = new Random();

  late final _stateController = StreamController<State>.broadcast();

  State _state;

  @override
  State get state => _state;

  @override
  Stream<State> get stream => _stateController.stream;

  @override
  bool get isClosed => _stateController.isClosed;

  IsolatedBloc(this._createBloc) : _state = _createBloc().state {
    _fromIsolatePort.listen((message) {
      if (message is SendPortMessageToMain) {
        _toIsolatePort = message.sendPort;
      }
      if (message is State) {
        _state = message;
        _stateController.add(message);
      }
    });
    blocMainIsolateLogic.sendMessage(CreateBlocMessageToIsolate(
      _createBloc,
      _fromIsolatePort.sendPort,
      _key,
    ));
  }

  void add(Event event) {
    if (_stateController.isClosed) {
      return;
    }
    if (_toIsolatePort != null) {
      _toIsolatePort?.send(EventMessageToIsolate(event: event));
    } else {
      Future.delayed(Duration(milliseconds: 50)).then((value) {
        this.add(event);
      });
    }
  }

  @override
  Future<void> close() async {
    await _stateController.close();
    blocMainIsolateLogic.sendMessage(CloseBlocMessageToIsolate(key: _key));
    _toIsolatePort = null;
    _fromIsolatePort.close();
  }
}

class CreateBlocMessageToIsolate<State, Event> extends MessageToIsolate {
  final CreateBloc<State, Event> createBloc;
  final SendPort toMainSendPort;
  final int uniqueKey;

  CreateBlocMessageToIsolate(this.createBloc, this.toMainSendPort, this.uniqueKey);
}

class CloseBlocMessageToIsolate extends MessageToIsolate {
  final int key;

  CloseBlocMessageToIsolate({required this.key});
}

class EventMessageToIsolate<E> extends MessageToIsolate {
  final E event;

  EventMessageToIsolate({required this.event});
}

class CallableMessageToIsolate extends MessageToIsolate {
  void call() {}
}

class BlocIsolateLogic extends BidirectionalIsolateLogic {
  final Map<int, StreamSubscription<dynamic>> _subscriptions = {};
  final Map<int, StreamSubscription<dynamic>> _fromMainSubscriptions = {};
  final Map<int, Bloc> _blocs = {};

  @override
  void handleMessage(MessageToIsolate message) {
    if (message is CreateBlocMessageToIsolate) {
      final bloc = message.createBloc();
      final subscription = bloc.stream.listen((state) {
        message.toMainSendPort.send(state);
      });
      _subscriptions[message.uniqueKey] = subscription;
      _blocs[message.uniqueKey] = bloc;

      final port = ReceivePort();

      message.toMainSendPort.send(SendPortMessageToMain(sendPort: port.sendPort));
      final fromMainSubsription = port.listen((message) {
        if (message is EventMessageToIsolate) {
          print(message.event);
          bloc.add(message.event);
        }
      });
      _fromMainSubscriptions[message.uniqueKey] = fromMainSubsription;
    }
    if (message is CloseBlocMessageToIsolate) {
      _subscriptions[message.key]?.cancel();
      _subscriptions.remove(message.key);
      _fromMainSubscriptions[message.key]?.cancel();
      _fromMainSubscriptions.remove(message.key);
      _blocs[message.key]?.close();
      _blocs.remove(message.key);
    }
    if (message is CallableMessageToIsolate) {
      message();
    }
  }
}

class BlocMainIsolateLogic implements MessagesFromIsolateConsumer {
  late BidirectionalIsolate _task;

  void sendMessage(MessageToIsolate message) {
    _task.sendMessage(message);
  }

  Future<void> run() async {
    _task = BidirectionalIsolate(BlocIsolateLogic(), this);
    await _task.start();
  }

  @override
  void handleMessage(MessageToMain event) {}
}
