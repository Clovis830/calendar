part of 'sql.dart';

String showTables = '''
  SELECT 
      name
  FROM 
      sqlite_master 
  WHERE 
      type ='table' AND 
      name NOT LIKE 'sqlite_%';
''';

const String selectDbPath = '''
  SELECT name, path FROM $tableAppSettings WHERE name='$calibreColumnName'
''';
