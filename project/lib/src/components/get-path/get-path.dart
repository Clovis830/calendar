import 'dart:async';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/components/error/index.dart';

class GetPath extends StatefulWidget {
  GetPath({Key key}) : super(key: key);

  final StreamController<String> pathStream = StreamController<String>();

  @override
  _GetPathState createState() => _GetPathState();
}

class _GetPathState extends State<GetPath> {
  _openPopup(BuildContext context) async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();
      print('---${result.files.single.path}');
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
        child: InkWell(
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
