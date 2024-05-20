import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../counter/counter_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: items,
        currentIndex: 0,
        backgroundColor: Colors.white,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return switch (index) {
              0 => const CounterPage(title: 'Page 1'),
              1 => const CounterPage(title: 'Page 2'),
              2 => const CounterPage(title: 'Page 3'),
              3 => const CounterPage(title: 'Page 4'),
              int() => throw UnimplementedError(),
            };
          },
        );
      },
    );
  }

  final items = [
    const BottomNavigationBarItem(
      label: 'Tab 1',
      icon: Icon(Icons.tab),
    ),
    const BottomNavigationBarItem(
      label: 'Tab 2',
      icon: Icon(Icons.tab),
    ),
    const BottomNavigationBarItem(
      label: 'Tab 3',
      icon: Icon(Icons.tab),
    ),
    const BottomNavigationBarItem(
      label: 'Tab 4',
      icon: Icon(Icons.tab),
    ),
  ];
}
