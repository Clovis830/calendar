import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/error/index.dart';

class AppRoute extends StatelessWidget {
  final Widget child;
  const AppRoute({Key key, this.child}) : super(key: key);

  Future<void> _showErrorDialog(BuildContext context, ErrorState state) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Error(message: state.message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: BlocListener<ErrorBloc, ErrorState>(
        listener: (context, state) {
          if (state is ErrorStateActive) {
            _showErrorDialog(context, state);
          }
        },
        child: BlocBuilder<ErrorBloc, ErrorState>(
          builder: (context, state) {
            if (state is ErrorStateActive) {
              return Center(child: Text('error hide'));
            }
            return Center(child: child);
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              BlocProvider.of<ErrorBloc>(context)..add(ErrorEventShow('test message'));
            },
          ),
        ],
      ),
    );
  }
}
