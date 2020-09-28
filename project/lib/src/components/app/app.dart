import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/loader/index.dart';
import 'package:calendar/src/screens/get-path/get-path.dart';
import 'package:calendar/src/screens/home/index.dart';
import 'package:calendar/src/screens/library/library.dart';
import 'package:calendar/src/screens/library/bloc/library_bloc.dart';
import 'package:calendar/src/screens/ratings/ratings.dart';

import 'package:calendar/src/repositories/repositories.dart';

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

  final ErrorBloc _errorBloc = ErrorBloc();
  final LoaderBloc _loaderBloc = LoaderBloc();
  final CalibreRepository _calibreRepository = CalibreRepository(_errorBloc, _loaderBloc);

  final _appBloc = AppBloc(_calibreRepository);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ErrorBloc>(
          create: (BuildContext context) => _errorBloc,
        ),
        BlocProvider<LoaderBloc>(
          create: (BuildContext context) => _loaderBloc,
        ),
        BlocProvider<AppBloc>(
          create: (BuildContext context) => _appBloc,
        ),
      ],
      child: RepositoryProvider(
        create: (context) => _calibreRepository,
        child: MaterialApp(
          title: 'Calendar',
          theme: getTheme(),
          initialRoute: Routes.home.toString(),
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }

  dispose() {
    _errorBloc.close();
    _loaderBloc.close();
    _appBloc.close();
  }
}
