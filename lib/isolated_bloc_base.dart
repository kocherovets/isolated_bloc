import 'package:bloc/bloc.dart';

class MessageToIsolate {}

class MessageToMain {}

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

typedef CreateBloc<E, S> = Bloc<E, S> Function();
