import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isolated_bloc/isolated_bloc.dart';

import 'ball_bloc.dart';
import 'game_params.dart';
import 'player_bloc.dart';

// ignore: use_key_in_widget_constructors
class PingPongGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Ping Pong'),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => BallBloc()),
            BlocProvider(
                create: (BuildContext context) => TopPlayerBloc(isolateName: 'top-player')),
            BlocProvider(
                create: (BuildContext context) => BottomPlayerBloc(isolateName: 'bottom-player')),
          ],
          child: GameScreen(
            field: Field(
              width: MediaQuery.of(context).size.width - 2 * Field.fieldXPadding,
              height: MediaQuery.of(context).size.height - 2 * Field.fieldYPadding,
            ),
          ),
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  final Field field;

  const GameScreen({super.key, required this.field});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  late GameParameters params;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    params = GameParameters(
      ball: const Ball(
        x: 100,
        y: 100,
        velocityX: 4,
        velocityY: 4,
        size: 20,
      ),
      topPlayer: const Player(
        isTopPlayer: true,
        paddleX: 100,
        paddleVelocity: 3.5,
        paddleWidth: 100,
        paddleHeight: 20,
      ),
      bottomPlayer: const Player(
        isTopPlayer: false,
        paddleX: 100,
        paddleVelocity: 4,
        paddleWidth: 100,
        paddleHeight: 20,
      ),
      field: widget.field,
    );

    timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      BlocProvider.of<BallBloc>(context).add(BallBlocEvent.params(params));
      BlocProvider.of<TopPlayerBloc>(context).add(PlayerBlocEvent.params(params));
      BlocProvider.of<BottomPlayerBloc>(context).add(PlayerBlocEvent.params(params));
    });

    BlocProvider.of<BallBloc>(context).stream.listen((state) {
      if (state is BallBlocBallState) {
        if (state.ball case var ball?) {
          setState(() {
            params = params.copyWith(ball: ball);
          });
        }
      }
    });
    BlocProvider.of<TopPlayerBloc>(context).stream.listen((state) {
      if (state is PlayerBlocPlayerState) {
        if (state.player case var player?) {
          setState(() {
            params = params.copyWith(topPlayer: player);
          });
        }
      }
    });
    BlocProvider.of<BottomPlayerBloc>(context).stream.listen((state) {
      if (state is PlayerBlocPlayerState) {
        if (state.player case var player?) {
          setState(() {
            params = params.copyWith(bottomPlayer: player);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    IsolatedBloc.isolatesDispatcher.removeIsolate(isolateName: 'top-player');
    IsolatedBloc.isolatesDispatcher.removeIsolate(isolateName: 'bottom-player');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Field.fieldXPadding,
            vertical: Field.fieldYPadding,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              ),
              Positioned(
                top: 0,
                left: params.topPlayer.paddleX,
                child: Container(
                  width: params.topPlayer.paddleWidth,
                  height: params.topPlayer.paddleHeight,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                bottom: 0,
                left: params.bottomPlayer.paddleX,
                child: Container(
                  width: params.bottomPlayer.paddleWidth,
                  height: params.bottomPlayer.paddleHeight,
                  color: Colors.green,
                ),
              ),
              Positioned(
                top: params.ball.y,
                left: params.ball.x,
                child: Container(
                  width: params.ball.size,
                  height: params.ball.size,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 193, 59),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
