import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isolated_bloc/isolated_bloc.dart';

import 'game_params.dart';

part 'ball_bloc.freezed.dart';

@Freezed(copyWith: false, map: FreezedMapOptions.none, when: FreezedWhenOptions.none)
sealed class BallBlocEvent with _$BallBlocEvent {
  const factory BallBlocEvent.params(GameParameters params) = BallBlocParamsEvent;
}

@Freezed(copyWith: false, map: FreezedMapOptions.none, when: FreezedWhenOptions.none)
sealed class BallBlocState with _$BallBlocState {
  const factory BallBlocState.ball(Ball? ball) = BallBlocBallState;
}

class BallBloc extends IsolatedBloc<BallBlocEvent, BallBlocState> {
  BallBloc() : super(() => _BallBloc());
}

class _BallBloc extends Bloc<BallBlocEvent, BallBlocState> {
  _BallBloc() : super(const BallBlocState.ball(null)) {
    on<BallBlocParamsEvent>(_onChange, transformer: droppable());
  }

  Future<void> _onChange(
    BallBlocParamsEvent event,
    Emitter<BallBlocState> emit,
  ) async {
    emit(BallBlocState.ball(event.params.moveBall()));
  }
}
