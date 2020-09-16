import 'package:calendar/src/services/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/screens/home/bloc/home_bloc.dart';
import 'package:calendar/src/services/service-locator.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () async {
          final authors = await getService<CalibreRepository>().getAuthors();
          print('pressed $authors');
          BlocProvider.of<HomeBloc>(context).add(HomeEventStarted());
        },
        child: Text('button'));
  }
}
