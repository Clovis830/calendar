import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/app/app.dart';
import 'package:calendar/src/screens/get-path/get-path-controller.dart';

class GetPath extends StatelessWidget {
  GetPath({Key key}) : super(key: key);
  final _controller = GetPathController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
          height: 300,
          width: width * 0.8,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _controller.openFileSystem(context);
                },
                child: Column(
                  children: [
                    Icon(Icons.file_download),
                    BlocBuilder<AppBloc, AppState>(
                      builder: (BuildContext context, state) {
                        String headerInfo = state.pathToCalibre == null
                            ? 'Укажите путь к папке с библиотекой Calibre'
                            : 'Текущий путь к папке с библиотекой Calibre';
                        return Text(
                          headerInfo,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: BlocBuilder<AppBloc, AppState>(
                  builder: (BuildContext context, state) {
                    TextStyle style = const TextStyle(color: Colors.black54, fontSize: 13.0, fontStyle: FontStyle.italic, decoration: TextDecoration.underline);

                    if (state.pathToCalibre == null) {
                      return Text('---', style: style);
                    }
                    return Column(
                      children: [
                        Text(state.pathToCalibre, style: style),
                        SizedBox(
                          width: double.infinity,
                          height: 40.0,
                          child: FlatButton(
                              color: Colors.blue,
                              onPressed: () {
                                AppRouter.goTo(context, Routes.home);
                              },
                              child: Text('Перейти на главную')),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
