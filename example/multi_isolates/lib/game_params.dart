import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_params.freezed.dart';

@freezed
class Ball with _$Ball {
  const factory Ball({
    required double x,
    required double y,
    required double velocityX,
    required double velocityY,
    required double size,
  }) = _Ball;
}

@freezed
class Player with _$Player {
  const factory Player({
    required bool isTopPlayer,
    required double paddleX,
    required double paddleVelocity,
    required double paddleWidth,
    required double paddleHeight,
  }) = _Player;
}

@freezed
class Field with _$Field {
  static double fieldXPadding = 20.0;
  static double fieldYPadding = 100.0;

  const factory Field({
    required double width,
    required double height,
  }) = _Field;
}

@freezed
class GameParameters with _$GameParameters {
  const factory GameParameters({
    required Ball ball,
    required Player topPlayer,
    required Player bottomPlayer,
    required Field field,
  }) = _GameParameters;
}

extension GameParametersExt on GameParameters {
  Ball moveBall() {
    double ballX = ball.x;
    double ballY = ball.y;
    double velocityX = ball.velocityX;
    double velocityY = ball.velocityY;

    ballX += ball.velocityX;
    ballY += ball.velocityY;

    if (ballX <= 0 || ballX + ball.size >= field.width) {
      velocityX = -velocityX;
    }
    if (ballY <= 0) {
      velocityY = velocityY.abs();
    }
    if (ballY + ball.size >= field.height) {
      velocityY = -velocityY.abs();
    }

    if (ballY + ball.size >= field.height - bottomPlayer.paddleHeight &&
        ballX + ball.size >= bottomPlayer.paddleX &&
        ballX <= bottomPlayer.paddleX + bottomPlayer.paddleWidth) {
      velocityY = -velocityY.abs();
    }

    if (ballY <= topPlayer.paddleHeight &&
        ballX + ball.size >= topPlayer.paddleX &&
        ballX <= topPlayer.paddleX + topPlayer.paddleWidth) {
      velocityY = velocityY.abs();
    }

    return Ball(
      x: ballX,
      y: ballY,
      velocityX: velocityX,
      velocityY: velocityY,
      size: ball.size,
    );
  }

  Player movePlayer(Player player) {
    double paddleX = player.paddleX;

    if (player.isTopPlayer && ball.velocityY > 0) {
      return player;
    }

    if (!player.isTopPlayer && ball.velocityY < 0) {
      return player;
    }

    paddleX += (ball.x - player.paddleWidth / 2) - player.paddleX < 0
        ? -player.paddleVelocity
        : player.paddleVelocity;

    if (paddleX < 0) {
      paddleX = 0;
    }
    if (paddleX + player.paddleWidth > field.width) {
      paddleX = field.width - player.paddleWidth;
    }

    return player.copyWith(paddleX: paddleX);
  }
}
