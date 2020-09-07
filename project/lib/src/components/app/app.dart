import 'package:flutter/material.dart';

import 'package:calendar/src/screens/home/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/app/navigation.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      initialRoute: routesMap[Routes.home],
      routes: {
        routesMap[Routes.home]: (BuildContext context) => BlocProvider<HomeBloc>(
              create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
              child: Home(),
            ),
        '/second': (context) => Home(),
      },
    );
  }
}
