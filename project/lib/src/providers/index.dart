import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';

part 'db-calibre.dart';
part 'i-provider.dart';
part 'rest.dart';

final Set<IProvider> _container = {};

void initProviders() {
  _container.addAll([DbCalibre(), Rest()]);
}

setService(IProvider service) {
  _container.add(service);
}

T getService<T extends IProvider>() {
  Iterable<T> values = _container.whereType<T>();
  if (values.isEmpty) {
    print('Error! Service with type $T not found!');
  }
  return values.single;
}
