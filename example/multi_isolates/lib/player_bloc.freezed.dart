// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayerBlocEvent {
  GameParameters get params => throw _privateConstructorUsedError;
}

/// @nodoc

class _$PlayerBlocParamsEventImpl implements PlayerBlocParamsEvent {
  const _$PlayerBlocParamsEventImpl(this.params);

  @override
  final GameParameters params;

  @override
  String toString() {
    return 'PlayerBlocEvent.params(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerBlocParamsEventImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);
}

abstract class PlayerBlocParamsEvent implements PlayerBlocEvent {
  const factory PlayerBlocParamsEvent(final GameParameters params) =
      _$PlayerBlocParamsEventImpl;

  @override
  GameParameters get params;
}

/// @nodoc
mixin _$PlayerBlocState {
  Player? get player => throw _privateConstructorUsedError;
}

/// @nodoc

class _$PlayerBlocPlayerStateImpl implements PlayerBlocPlayerState {
  const _$PlayerBlocPlayerStateImpl(this.player);

  @override
  final Player? player;

  @override
  String toString() {
    return 'PlayerBlocState.player(player: $player)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerBlocPlayerStateImpl &&
            (identical(other.player, player) || other.player == player));
  }

  @override
  int get hashCode => Object.hash(runtimeType, player);
}

abstract class PlayerBlocPlayerState implements PlayerBlocState {
  const factory PlayerBlocPlayerState(final Player? player) =
      _$PlayerBlocPlayerStateImpl;

  @override
  Player? get player;
}
