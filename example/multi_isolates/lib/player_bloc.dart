import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isolated_bloc/isolated_bloc.dart';

import 'game_params.dart';

part 'player_bloc.freezed.dart';

@Freezed(copyWith: false, map: FreezedMapOptions.none, when: FreezedWhenOptions.none)
sealed class PlayerBlocEvent with _$PlayerBlocEvent {
  const factory PlayerBlocEvent.params(GameParameters params) = PlayerBlocParamsEvent;
}

@Freezed(copyWith: false, map: FreezedMapOptions.none, when: FreezedWhenOptions.none)
sealed class PlayerBlocState with _$PlayerBlocState {
  const factory PlayerBlocState.player(Player? player) = PlayerBlocPlayerState;
}

class TopPlayerBloc extends IsolatedBloc<PlayerBlocEvent, PlayerBlocState> {
  TopPlayerBloc({required String isolateName})
      : super(() => PlayerBloc(isTopPlayer: true), isolateName: isolateName);
}

class BottomPlayerBloc extends IsolatedBloc<PlayerBlocEvent, PlayerBlocState> {
  BottomPlayerBloc({required String isolateName})
      : super(() => PlayerBloc(isTopPlayer: false), isolateName: isolateName);
}

class PlayerBloc extends Bloc<PlayerBlocEvent, PlayerBlocState> {
  final bool _isTopPlayer;

  PlayerBloc({required bool isTopPlayer})
      : _isTopPlayer = isTopPlayer,
        super(const PlayerBlocState.player(null)) {
    on<PlayerBlocParamsEvent>(_onChange, transformer: droppable());
  }

  Future<void> _onChange(
    PlayerBlocParamsEvent event,
    Emitter<PlayerBlocState> emit,
  ) async {
    if (_isTopPlayer) {
      emit(PlayerBlocState.player(event.params.movePlayer(event.params.topPlayer)));
    } else {
      emit(PlayerBlocState.player(event.params.movePlayer(event.params.bottomPlayer)));
    }
  }
}
