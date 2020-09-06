import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';

part 'db-calibre.dart';
part 'i-provider.dart';
part 'rest.dart';

enum ServiceKeys { calibre, rest }

final Map<ServiceKeys, IProvider> serviceLocator = {ServiceKeys.calibre: DbCalibre(), ServiceKeys.rest: Rest()};
