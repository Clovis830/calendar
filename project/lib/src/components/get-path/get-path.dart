import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/app.dart';
import 'package:calendar/src/components/get-path/path-bloc.dart';

class GetPath extends StatelessWidget {
  GetPath({Key key}) : super(key: key);
  final _controller = PathBloc();

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
                    Text(
                      'Укажите путь к папке с библиотекой Calibre',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: StreamBuilder<String>(
                  stream: _controller.pathUpdate,
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (!snapshot.hasData) {
                      return Text('---');
                    }
                    return Column(
                      children: [
                        Text(snapshot.data),
                        SizedBox(
                          width: double.infinity,
                          height: 40.0,
                          child: FlatButton(
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
