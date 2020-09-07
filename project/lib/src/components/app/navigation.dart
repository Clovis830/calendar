import 'package:flutter/material.dart';

enum Routes { home }

const Map<Routes, String> routesMap = {Routes.home: '/'};

void goTo(BuildContext context, Routes name) {
  Navigator.pushNamed(context, routesMap[name]);
}

void goBack(BuildContext context) {
  Navigator.pop(context);
}
