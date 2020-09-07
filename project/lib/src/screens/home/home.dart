import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/screens/home/bloc/home_bloc.dart';
import 'package:calendar/src/providers/index.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text("Home")),
            body: RaisedButton(
                onPressed: () async {
                  final authors = await getService<DbCalibre>().query('authors');
                  print('pressed $authors');
                  BlocProvider.of<HomeBloc>(context).add(HomeEventStarted());
                },
                child: Text('button'))));
  }
}
