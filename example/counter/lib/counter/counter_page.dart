import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterPage extends StatefulWidget {
  final String title;

  const CounterPage({super.key, required this.title});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.repeat();
      }
    });
    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CounterBloc()),
      ],
      child: BlocBuilder<CounterBloc, CounterBlocState>(
        builder: (context, state) {
          return Material(
            child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(widget.title),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return SafeArea(
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 110),
                            if (state is CounterBlocValue)
                              Text(
                                '${state.counter}',
                                style: const TextStyle(fontSize: 50),
                              ),
                            const SizedBox(height: 110),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CupertinoButton.filled(
                                child: const Text(
                                  '+',
                                  style: TextStyle(fontSize: 40),
                                ),
                                onPressed: () => BlocProvider.of<CounterBloc>(context).add(
                                  const CounterBlocEvent.increment(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            if (state is CounterBlocValue)
                              Text(
                                'Progress: ${state.progress}',
                                style: const TextStyle(fontSize: 30),
                              ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) => Transform.translate(
                          offset: Offset(
                            cos(_animationController.value * pi * 2) * 120 +
                                constraints.maxWidth / 2 -
                                25,
                            sin(_animationController.value * pi * 2) * 100 + 120,
                          ),
                          child: child,
                        ),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
