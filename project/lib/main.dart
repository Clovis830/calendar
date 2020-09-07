import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:calendar/src/app.dart';
import 'package:calendar/src/observers/test.dart';
import 'package:calendar/src/providers/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initProviders();
  Bloc.observer = SimpleBlocObserver();

  runApp(App());
}
