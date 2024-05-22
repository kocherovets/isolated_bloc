// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Ball {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get velocityX => throw _privateConstructorUsedError;
  double get velocityY => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BallCopyWith<Ball> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BallCopyWith<$Res> {
  factory $BallCopyWith(Ball value, $Res Function(Ball) then) =
      _$BallCopyWithImpl<$Res, Ball>;
  @useResult
  $Res call(
      {double x, double y, double velocityX, double velocityY, double size});
}

/// @nodoc
class _$BallCopyWithImpl<$Res, $Val extends Ball>
    implements $BallCopyWith<$Res> {
  _$BallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? velocityX = null,
    Object? velocityY = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      velocityX: null == velocityX
          ? _value.velocityX
          : velocityX // ignore: cast_nullable_to_non_nullable
              as double,
      velocityY: null == velocityY
          ? _value.velocityY
          : velocityY // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BallImplCopyWith<$Res> implements $BallCopyWith<$Res> {
  factory _$$BallImplCopyWith(
          _$BallImpl value, $Res Function(_$BallImpl) then) =
      __$$BallImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double x, double y, double velocityX, double velocityY, double size});
}

/// @nodoc
class __$$BallImplCopyWithImpl<$Res>
    extends _$BallCopyWithImpl<$Res, _$BallImpl>
    implements _$$BallImplCopyWith<$Res> {
  __$$BallImplCopyWithImpl(_$BallImpl _value, $Res Function(_$BallImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? velocityX = null,
    Object? velocityY = null,
    Object? size = null,
  }) {
    return _then(_$BallImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      velocityX: null == velocityX
          ? _value.velocityX
          : velocityX // ignore: cast_nullable_to_non_nullable
              as double,
      velocityY: null == velocityY
          ? _value.velocityY
          : velocityY // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BallImpl implements _Ball {
  const _$BallImpl(
      {required this.x,
      required this.y,
      required this.velocityX,
      required this.velocityY,
      required this.size});

  @override
  final double x;
  @override
  final double y;
  @override
  final double velocityX;
  @override
  final double velocityY;
  @override
  final double size;

  @override
  String toString() {
    return 'Ball(x: $x, y: $y, velocityX: $velocityX, velocityY: $velocityY, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BallImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.velocityX, velocityX) ||
                other.velocityX == velocityX) &&
            (identical(other.velocityY, velocityY) ||
                other.velocityY == velocityY) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, x, y, velocityX, velocityY, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BallImplCopyWith<_$BallImpl> get copyWith =>
      __$$BallImplCopyWithImpl<_$BallImpl>(this, _$identity);
}

abstract class _Ball implements Ball {
  const factory _Ball(
      {required final double x,
      required final double y,
      required final double velocityX,
      required final double velocityY,
      required final double size}) = _$BallImpl;

  @override
  double get x;
  @override
  double get y;
  @override
  double get velocityX;
  @override
  double get velocityY;
  @override
  double get size;
  @override
  @JsonKey(ignore: true)
  _$$BallImplCopyWith<_$BallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Player {
  bool get isTopPlayer => throw _privateConstructorUsedError;
  double get paddleX => throw _privateConstructorUsedError;
  double get paddleVelocity => throw _privateConstructorUsedError;
  double get paddleWidth => throw _privateConstructorUsedError;
  double get paddleHeight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {bool isTopPlayer,
      double paddleX,
      double paddleVelocity,
      double paddleWidth,
      double paddleHeight});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTopPlayer = null,
    Object? paddleX = null,
    Object? paddleVelocity = null,
    Object? paddleWidth = null,
    Object? paddleHeight = null,
  }) {
    return _then(_value.copyWith(
      isTopPlayer: null == isTopPlayer
          ? _value.isTopPlayer
          : isTopPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      paddleX: null == paddleX
          ? _value.paddleX
          : paddleX // ignore: cast_nullable_to_non_nullable
              as double,
      paddleVelocity: null == paddleVelocity
          ? _value.paddleVelocity
          : paddleVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      paddleWidth: null == paddleWidth
          ? _value.paddleWidth
          : paddleWidth // ignore: cast_nullable_to_non_nullable
              as double,
      paddleHeight: null == paddleHeight
          ? _value.paddleHeight
          : paddleHeight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isTopPlayer,
      double paddleX,
      double paddleVelocity,
      double paddleWidth,
      double paddleHeight});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTopPlayer = null,
    Object? paddleX = null,
    Object? paddleVelocity = null,
    Object? paddleWidth = null,
    Object? paddleHeight = null,
  }) {
    return _then(_$PlayerImpl(
      isTopPlayer: null == isTopPlayer
          ? _value.isTopPlayer
          : isTopPlayer // ignore: cast_nullable_to_non_nullable
              as bool,
      paddleX: null == paddleX
          ? _value.paddleX
          : paddleX // ignore: cast_nullable_to_non_nullable
              as double,
      paddleVelocity: null == paddleVelocity
          ? _value.paddleVelocity
          : paddleVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      paddleWidth: null == paddleWidth
          ? _value.paddleWidth
          : paddleWidth // ignore: cast_nullable_to_non_nullable
              as double,
      paddleHeight: null == paddleHeight
          ? _value.paddleHeight
          : paddleHeight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PlayerImpl implements _Player {
  const _$PlayerImpl(
      {required this.isTopPlayer,
      required this.paddleX,
      required this.paddleVelocity,
      required this.paddleWidth,
      required this.paddleHeight});

  @override
  final bool isTopPlayer;
  @override
  final double paddleX;
  @override
  final double paddleVelocity;
  @override
  final double paddleWidth;
  @override
  final double paddleHeight;

  @override
  String toString() {
    return 'Player(isTopPlayer: $isTopPlayer, paddleX: $paddleX, paddleVelocity: $paddleVelocity, paddleWidth: $paddleWidth, paddleHeight: $paddleHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.isTopPlayer, isTopPlayer) ||
                other.isTopPlayer == isTopPlayer) &&
            (identical(other.paddleX, paddleX) || other.paddleX == paddleX) &&
            (identical(other.paddleVelocity, paddleVelocity) ||
                other.paddleVelocity == paddleVelocity) &&
            (identical(other.paddleWidth, paddleWidth) ||
                other.paddleWidth == paddleWidth) &&
            (identical(other.paddleHeight, paddleHeight) ||
                other.paddleHeight == paddleHeight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isTopPlayer, paddleX,
      paddleVelocity, paddleWidth, paddleHeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);
}

abstract class _Player implements Player {
  const factory _Player(
      {required final bool isTopPlayer,
      required final double paddleX,
      required final double paddleVelocity,
      required final double paddleWidth,
      required final double paddleHeight}) = _$PlayerImpl;

  @override
  bool get isTopPlayer;
  @override
  double get paddleX;
  @override
  double get paddleVelocity;
  @override
  double get paddleWidth;
  @override
  double get paddleHeight;
  @override
  @JsonKey(ignore: true)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Field {
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FieldCopyWith<Field> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldCopyWith<$Res> {
  factory $FieldCopyWith(Field value, $Res Function(Field) then) =
      _$FieldCopyWithImpl<$Res, Field>;
  @useResult
  $Res call({double width, double height});
}

/// @nodoc
class _$FieldCopyWithImpl<$Res, $Val extends Field>
    implements $FieldCopyWith<$Res> {
  _$FieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldImplCopyWith<$Res> implements $FieldCopyWith<$Res> {
  factory _$$FieldImplCopyWith(
          _$FieldImpl value, $Res Function(_$FieldImpl) then) =
      __$$FieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double width, double height});
}

/// @nodoc
class __$$FieldImplCopyWithImpl<$Res>
    extends _$FieldCopyWithImpl<$Res, _$FieldImpl>
    implements _$$FieldImplCopyWith<$Res> {
  __$$FieldImplCopyWithImpl(
      _$FieldImpl _value, $Res Function(_$FieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$FieldImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FieldImpl implements _Field {
  const _$FieldImpl({required this.width, required this.height});

  @override
  final double width;
  @override
  final double height;

  @override
  String toString() {
    return 'Field(width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldImplCopyWith<_$FieldImpl> get copyWith =>
      __$$FieldImplCopyWithImpl<_$FieldImpl>(this, _$identity);
}

abstract class _Field implements Field {
  const factory _Field(
      {required final double width,
      required final double height}) = _$FieldImpl;

  @override
  double get width;
  @override
  double get height;
  @override
  @JsonKey(ignore: true)
  _$$FieldImplCopyWith<_$FieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameParameters {
  Ball get ball => throw _privateConstructorUsedError;
  Player get topPlayer => throw _privateConstructorUsedError;
  Player get bottomPlayer => throw _privateConstructorUsedError;
  Field get field => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameParametersCopyWith<GameParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameParametersCopyWith<$Res> {
  factory $GameParametersCopyWith(
          GameParameters value, $Res Function(GameParameters) then) =
      _$GameParametersCopyWithImpl<$Res, GameParameters>;
  @useResult
  $Res call({Ball ball, Player topPlayer, Player bottomPlayer, Field field});

  $BallCopyWith<$Res> get ball;
  $PlayerCopyWith<$Res> get topPlayer;
  $PlayerCopyWith<$Res> get bottomPlayer;
  $FieldCopyWith<$Res> get field;
}

/// @nodoc
class _$GameParametersCopyWithImpl<$Res, $Val extends GameParameters>
    implements $GameParametersCopyWith<$Res> {
  _$GameParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ball = null,
    Object? topPlayer = null,
    Object? bottomPlayer = null,
    Object? field = null,
  }) {
    return _then(_value.copyWith(
      ball: null == ball
          ? _value.ball
          : ball // ignore: cast_nullable_to_non_nullable
              as Ball,
      topPlayer: null == topPlayer
          ? _value.topPlayer
          : topPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
      bottomPlayer: null == bottomPlayer
          ? _value.bottomPlayer
          : bottomPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Field,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BallCopyWith<$Res> get ball {
    return $BallCopyWith<$Res>(_value.ball, (value) {
      return _then(_value.copyWith(ball: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get topPlayer {
    return $PlayerCopyWith<$Res>(_value.topPlayer, (value) {
      return _then(_value.copyWith(topPlayer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get bottomPlayer {
    return $PlayerCopyWith<$Res>(_value.bottomPlayer, (value) {
      return _then(_value.copyWith(bottomPlayer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get field {
    return $FieldCopyWith<$Res>(_value.field, (value) {
      return _then(_value.copyWith(field: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameParametersImplCopyWith<$Res>
    implements $GameParametersCopyWith<$Res> {
  factory _$$GameParametersImplCopyWith(_$GameParametersImpl value,
          $Res Function(_$GameParametersImpl) then) =
      __$$GameParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ball ball, Player topPlayer, Player bottomPlayer, Field field});

  @override
  $BallCopyWith<$Res> get ball;
  @override
  $PlayerCopyWith<$Res> get topPlayer;
  @override
  $PlayerCopyWith<$Res> get bottomPlayer;
  @override
  $FieldCopyWith<$Res> get field;
}

/// @nodoc
class __$$GameParametersImplCopyWithImpl<$Res>
    extends _$GameParametersCopyWithImpl<$Res, _$GameParametersImpl>
    implements _$$GameParametersImplCopyWith<$Res> {
  __$$GameParametersImplCopyWithImpl(
      _$GameParametersImpl _value, $Res Function(_$GameParametersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ball = null,
    Object? topPlayer = null,
    Object? bottomPlayer = null,
    Object? field = null,
  }) {
    return _then(_$GameParametersImpl(
      ball: null == ball
          ? _value.ball
          : ball // ignore: cast_nullable_to_non_nullable
              as Ball,
      topPlayer: null == topPlayer
          ? _value.topPlayer
          : topPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
      bottomPlayer: null == bottomPlayer
          ? _value.bottomPlayer
          : bottomPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as Field,
    ));
  }
}

/// @nodoc

class _$GameParametersImpl implements _GameParameters {
  const _$GameParametersImpl(
      {required this.ball,
      required this.topPlayer,
      required this.bottomPlayer,
      required this.field});

  @override
  final Ball ball;
  @override
  final Player topPlayer;
  @override
  final Player bottomPlayer;
  @override
  final Field field;

  @override
  String toString() {
    return 'GameParameters(ball: $ball, topPlayer: $topPlayer, bottomPlayer: $bottomPlayer, field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameParametersImpl &&
            (identical(other.ball, ball) || other.ball == ball) &&
            (identical(other.topPlayer, topPlayer) ||
                other.topPlayer == topPlayer) &&
            (identical(other.bottomPlayer, bottomPlayer) ||
                other.bottomPlayer == bottomPlayer) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ball, topPlayer, bottomPlayer, field);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameParametersImplCopyWith<_$GameParametersImpl> get copyWith =>
      __$$GameParametersImplCopyWithImpl<_$GameParametersImpl>(
          this, _$identity);
}

abstract class _GameParameters implements GameParameters {
  const factory _GameParameters(
      {required final Ball ball,
      required final Player topPlayer,
      required final Player bottomPlayer,
      required final Field field}) = _$GameParametersImpl;

  @override
  Ball get ball;
  @override
  Player get topPlayer;
  @override
  Player get bottomPlayer;
  @override
  Field get field;
  @override
  @JsonKey(ignore: true)
  _$$GameParametersImplCopyWith<_$GameParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
