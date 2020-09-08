import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/navigation.dart';

class Error extends StatelessWidget {
  final String message;
  const Error({Key key, this.message}) : super(key: key);

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
