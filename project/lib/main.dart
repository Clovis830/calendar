import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:calendar/src/app.dart';
import 'package:calendar/src/observers/test.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(App());
}
