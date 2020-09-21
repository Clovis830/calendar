import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/app.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () async {
          AppRouter.goTo(context, Routes.ratings);
        },
        child: Text('button'));
  }
}
