import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isolated_bloc/isolated_bloc.dart';

part 'counter_bloc.freezed.dart';

@Freezed(copyWith: false, map: FreezedMapOptions.none, when: FreezedWhenOptions.none)
sealed class CounterBlocEvent with _$CounterBlocEvent {
  const factory CounterBlocEvent.increment() = CounterBlocIncrementEvent;
}

@Freezed(copyWith: false, map: FreezedMapOptions.none, when: FreezedWhenOptions.none)
sealed class CounterBlocState with _$CounterBlocState {
  const factory CounterBlocState.value(int counter, int progress) = CounterBlocValue;
}

class CounterBloc extends IsolatedBloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc() : super(() => _CounterBloc());
}

class _CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  int _counter = 1;

  _CounterBloc() : super(const CounterBlocState.value(1, 0)) {
    on<CounterBlocIncrementEvent>(_onIncrement, transformer: droppable());
  }

  Future<void> _onIncrement(
    CounterBlocIncrementEvent event,
    Emitter<CounterBlocState> emit,
  ) async {
    final dt = DateTime.now();
    int progress = 1;
    emit(CounterBlocState.value(_counter, progress));
    await Future.delayed(const Duration(milliseconds: 10));

    while (progress < 10) {
      while (DateTime.now().difference(dt).inSeconds < progress) {
        await heavyProcessing();
      }
      progress++;
      emit(CounterBlocState.value(_counter, progress));
      await Future.delayed(const Duration(milliseconds: 10));
    }

    _counter++;
    emit(CounterBlocState.value(_counter, 0));
  }

  Future<void> heavyProcessing() async {
    // ignore: unused_local_variable
    int value = 0;

    for (int i = 0; i < 10000; ++i) {
      value++;
    }
  }
}
