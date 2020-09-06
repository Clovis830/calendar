import 'package:flutter/material.dart';

import 'package:calendar/src/screens/home/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
            child: Home(),
          )
        ],
        child: MaterialApp(
          title: 'Calendar',
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            '/second': (context) => Home(),
          },
        ));
  }
}
