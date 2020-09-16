import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

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
