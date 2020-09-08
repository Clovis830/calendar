import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/app.dart';
import 'package:calendar/src/services/service-locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(App());
}
