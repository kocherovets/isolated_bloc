import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:isolate';

import 'isolated_bloc_base.dart';

class StopIsolate extends MessageToIsolate {}

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
  bool _isClosed = false;
  final _defferedMessages = Queue<MessageToIsolate>();

  BidirectionalIsolate(
    this._logic,
    this._fromIsolateConsumer,
  ) : _fromIsolatePort = ReceivePort();

  void start(String isolateName) {
    _fromIsolatePort.listen((event) {
      if (event is SendPort) {
        _toIsolatePort = event;
        if (_isClosed) {
          _toIsolatePort?.send(StopIsolate());
        }
      } else {
        _fromIsolateConsumer.handleMessage(event);
      }
    });

    Isolate.spawn<(SendPort, BidirectionalIsolateLogic)>(
      _entryPoint,
      (_fromIsolatePort.sendPort, _logic),
      debugName: isolateName,
    );
  }

  void stop() {
    sendMessage(StopIsolate());
    _isClosed = true;
  }

  void sendMessage([MessageToIsolate? message]) {
    if (_isClosed) {
      return;
    }
    if (_toIsolatePort != null) {
      while (_defferedMessages.isNotEmpty) {
        _toIsolatePort?.send(_defferedMessages.removeFirst());
      }
      if (message != null) {
        _toIsolatePort?.send(message);
      }
    } else {
      if (message != null) {
        _defferedMessages.add(message);
      }
      Future.delayed(Duration(milliseconds: 50)).then((value) {
        sendMessage();
      });
    }
  }

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
