import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';

part 'db-calibre.dart';
part 'i-provider.dart';
part 'rest.dart';

void initProviders(Set<dynamic> container) {
  container.addAll([PDbCalibre(), PRest()]);
}
