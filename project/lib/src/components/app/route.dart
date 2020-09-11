import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/loader/index.dart';
import 'package:calendar/src/components/app/navigation.dart';

class AppRoute extends StatelessWidget {
  final Widget child;
  const AppRoute({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ErrorBloc, ErrorState>(
            listener: (context, state) {
              if (state is ErrorStateActive) {
                Error.showErrorDialog(context, state);
              }
            },
          ),
          BlocListener<LoaderBloc, LoaderState>(
            listener: (context, state) {
              if (state is LoaderStateActive) {
                Loader.showLoader(context);
              }
              if (state is LoaderStateInActive) {
                Router.goBack(context);
              }
            },
          )
        ],
        child: child,
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () async {
              BlocProvider.of<ErrorBloc>(context)..add(ErrorEventShow('test message'));
              BlocProvider.of<LoaderBloc>(context)..add(LoaderActiveEvent());
              await Future.delayed(Duration(seconds: 5));
              BlocProvider.of<LoaderBloc>(context)..add(LoaderInActiveEvent());
            },
          ),
        ],
      ),
    );
  }
}
