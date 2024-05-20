import 'dart:async';
import 'dart:io';
import 'dart:isolate';

class MessageToIsolate {}

class StopIsolate extends MessageToIsolate {}

class MessageToMain {}

abstract class MessagesFromIsolateConsumer {
  void handleMessage(MessageToMain message);
}

abstract class BidirectionalIsolateLogic {
  SendPort? _toMainSendPort;
  void handleMessage(MessageToIsolate message);
  void sendMessage(MessageToMain message) => _toMainSendPort?.send(message);
}

class BidirectionalIsolate {
  final BidirectionalIsolateLogic _logic;
  final MessagesFromIsolateConsumer _fromIsolateConsumer;
  final ReceivePort _fromIsolatePort;
  SendPort? _toIsolatePort;

  BidirectionalIsolate(
    this._logic,
    this._fromIsolateConsumer,
  ) : _fromIsolatePort = ReceivePort();

  Future<void> start() async {
    Completer completer = Completer<SendPort>();

    _fromIsolatePort.listen((event) {
      if (event is SendPort) {
        completer.complete(event);
      } else {
        _fromIsolateConsumer.handleMessage(event);
      }
    });

    await Isolate.spawn<(SendPort, BidirectionalIsolateLogic)>(
      _entryPoint,
      (_fromIsolatePort.sendPort, _logic),
    );
    _toIsolatePort = await completer.future;
  }

  void stop() => _toIsolatePort?.send(StopIsolate());

  void sendMessage(MessageToIsolate message) => _toIsolatePort?.send(message);

  static void _entryPoint((SendPort, BidirectionalIsolateLogic) param) {
    var eventSendPort = param.$1;
    var logic = param.$2;
    logic._toMainSendPort = eventSendPort;
    var isolatedMessageReceivePort = ReceivePort();
    eventSendPort.send(isolatedMessageReceivePort.sendPort);

    isolatedMessageReceivePort.listen((message) {
      if (message is StopIsolate) {
        exit(0);
      } else {
        logic.handleMessage(message);
      }
    });
  }
}
