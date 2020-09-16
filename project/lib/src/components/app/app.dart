import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/loader/index.dart';
import 'package:calendar/src/screens/home/index.dart';

part 'common-providers.dart';
part 'navigation.dart';
part 'route.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders(context),
      child: MaterialApp(
        title: 'Calendar',
        initialRoute: routesMap[Routes.home],
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
