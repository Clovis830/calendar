import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/app/bloc/app_bloc.dart';

class PathBloc {
  final _pathStreamController = StreamController<String>();

  Stream<String> get pathUpdate => _pathStreamController.stream;

  openFileSystem(BuildContext context) async {
    try {
      final String path = await FilePicker.platform.getDirectoryPath();
      _savePath(path);
      BlocProvider.of<AppBloc>(context).add(AppEventWithPath(path));
    } catch (error) {
      BlocProvider.of<ErrorBloc>(context).add(ErrorEventShow(error.message));
    }
  }

  void _savePath(String path) {
    _pathStreamController.add(path);
  }

  void dispose() {
    _pathStreamController.close();
  }
}
