import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:calendar/src/components/app/app.dart';
import 'package:calendar/src/services/observers/test.dart';
import 'package:calendar/src/services/service-locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initServices();
  Bloc.observer = SimpleBlocObserver();

  runApp(App());
}
