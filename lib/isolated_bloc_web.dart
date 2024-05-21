import 'dart:async';

import 'package:bloc/bloc.dart';

import 'isolated_bloc.base.dart';

class InnerIsolatedBloc<Event, State> implements Bloc<Event, State> {
  final Bloc<Event, State> _bloc;

  static BlocMainIsolateLogic blocMainIsolateLogic = BlocMainIsolateLogic();

  InnerIsolatedBloc(CreateBloc<Event, State> createBloc) : _bloc = createBloc();

  @override
  bool get isClosed => _bloc.isClosed;

  @override
  State get state => _bloc.state;

  @override
  Stream<State> get stream => _bloc.stream;

  @override
  void add(Event event) {
    _bloc.add(event);
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _bloc.addError(error);
  }

  @override
  Future<void> close() {
    return _bloc.close();
  }

  @override
  void emit(State state) {
    // ignore: invalid_use_of_visible_for_testing_member
    _bloc.emit(state);
  }

  @override
  void on<E extends Event>(EventHandler<E, State> handler, {EventTransformer<E>? transformer}) {
    _bloc.on(handler, transformer: transformer);
  }

  @override
  void onChange(Change<State> change) {
    _bloc.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    _bloc.onError(error, stackTrace);
  }

  @override
  void onEvent(Event event) {
    _bloc.onEvent(event);
  }

  @override
  void onTransition(Transition<Event, State> transition) {
    _bloc.onTransition(transition);
  }
}

class BlocMainIsolateLogic {
  void sendMessage(MessageToIsolate message) {
    throw Exception('Dont use it in web');
  }

  Future<void> run() async {}

  void handleMessage(MessageToMain event) {}
}
