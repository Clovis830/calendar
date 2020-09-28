part of 'sql.dart';

// inserts and updates 

// const String insertCalibrePath = '''
//   IF EXISTS(SELECT $appInfoColDbPath FROM $tableAppInfo)
//     UPDATE $tableAppInfo set $appInfoColDbPath="?"
//   ELSE
//     INSERT into $tableAppInfo($appInfoColDbPath) VALUES(?)
// ''';

const String insertCalibrePath = '''
  INSERT into $tableAppSettings(name, path) VALUES($calibreColumnName, ?)
''';