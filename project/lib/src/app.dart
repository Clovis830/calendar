import 'package:flutter/material.dart';

import 'package:calendar/src/screens/home/index.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/second': (context) => Home(),
      },
    );
  }
}
