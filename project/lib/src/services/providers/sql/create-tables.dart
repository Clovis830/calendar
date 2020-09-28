part of 'sql.dart';

/// table AppInfo
const String tableAppSettings = 'AppSettings';

String createTables = '''
  CREATE TABLE IF NOT EXISTS `$tableAppSettings` (
    name varchar(30) NOT NULL PRIMARY KEY UNIQUE,   
    path varchar(100)
  )
''';
