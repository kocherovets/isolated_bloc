// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CounterBlocEvent {}

/// @nodoc

class _$CounterBlocIncrementEventImpl implements CounterBlocIncrementEvent {
  const _$CounterBlocIncrementEventImpl();

  @override
  String toString() {
    return 'CounterBlocEvent.increment()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterBlocIncrementEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class CounterBlocIncrementEvent implements CounterBlocEvent {
  const factory CounterBlocIncrementEvent() = _$CounterBlocIncrementEventImpl;
}

/// @nodoc
mixin _$CounterBlocState {
  int get counter => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
}

/// @nodoc

class _$CounterBlocValueImpl implements CounterBlocValue {
  const _$CounterBlocValueImpl(this.counter, this.progress);

  @override
  final int counter;
  @override
  final int progress;

  @override
  String toString() {
    return 'CounterBlocState.value(counter: $counter, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterBlocValueImpl &&
            (identical(other.counter, counter) || other.counter == counter) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter, progress);
}

abstract class CounterBlocValue implements CounterBlocState {
  const factory CounterBlocValue(final int counter, final int progress) =
      _$CounterBlocValueImpl;

  @override
  int get counter;
  @override
  int get progress;
}
