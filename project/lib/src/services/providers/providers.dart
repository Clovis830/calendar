import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

import 'package:calendar/src/services/providers/sql/sql.dart';

part 'db-provider.dart';
part 'i-provider.dart';
part 'good-reads-provider.dart';
part 'rest-provider.dart';

void initProviders(Set<dynamic> container, Map<String, dynamic> networkConfig) {
  container.addAll([
    DbProvider(),
    RestProvider(),
    GoodReadsProvider(networkConfig['goodReads']),
  ]);
}
