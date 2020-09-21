import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/app/app.dart';

import 'package:calendar/src/components/get-path/path-controller.dart';

class GetPath extends StatelessWidget {
  GetPath({Key key}) : super(key: key);
  final _controller = PathController();

  _openPopup(BuildContext context) async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      print('---${result.files.single.path}');
      _controller.savePath(result.files.single.path);
    } catch (error) {
      BlocProvider.of<ErrorBloc>(context).add(ErrorEventShow(error.message));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
          height: 100,
          width: width * 0.8,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _openPopup(context);
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
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (!snapshot.hasData) {
                      return Text('---');
                    }
                    return Column(
                      children: [
                        Text(snapshot.data),
                        SizedBox(width: double.infinity, height: 40.0, child: FlatButton(
                            onPressed: () {
                              AppRouter.goTo(context, Routes.home);
                            },
                            // child: Text('Перейти на главную')),
                            child: Text('lkl')),
                        ),
                      ],
                    );
                  },
                  stream: _controller.pathUpdate,
                ),
              ),
            ],
          )),
    );
  }
}
