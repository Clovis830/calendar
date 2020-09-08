import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/app/navigation.dart';
import 'package:calendar/src/components/error/bloc/error_bloc.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ErrorBloc>(
          create: (BuildContext context) => ErrorBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Calendar',
        initialRoute: routesMap[Routes.home],
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
