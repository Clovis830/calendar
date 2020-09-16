import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/app.dart';
import 'package:calendar/src/services/service-locator.dart';
import 'package:calendar/src/configs/nerwork.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices(networkConfig);
  runApp(App());
}
