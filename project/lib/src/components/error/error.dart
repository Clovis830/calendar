import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/navigation.dart';
import 'package:calendar/src/components/error/bloc/error_bloc.dart';

class Error extends StatelessWidget {
  final String message;
  const Error({Key key, this.message}) : super(key: key);

  static Future<void> showErrorDialog(BuildContext context, ErrorState state) async {
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
    return AlertDialog(
      title: Text('Ошибка!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(message),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Закрыть'),
          onPressed: () {
            Router.goBack(context);
          },
        ),
      ],
    );
  }
}
