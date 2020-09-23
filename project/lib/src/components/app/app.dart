import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/loader/index.dart';
import 'package:calendar/src/screens/get-path/get-path.dart';
import 'package:calendar/src/screens/home/index.dart';
import 'package:calendar/src/screens/ratings/ratings.dart';

import 'package:calendar/src/components/app/bloc/app_bloc.dart';
export 'package:calendar/src/components/app/bloc/app_bloc.dart';

part 'common-providers.dart';
part 'navigation.dart';
part 'route.dart';
part 'get-theme.dart';
part 'top-app-bar.dart';
part 'menu.dart';
part 'settings.dart';

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders(context),
      child: MaterialApp(
        title: 'Calendar',
        theme: getTheme(),
        initialRoute: Routes.home.toString(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
