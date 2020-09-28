part of 'providers.dart';

/// провайдер для работы с базой данной калибре;
/// копирование оригинальной базы в приложение;
/// изменение копии;
/// обновление оригинальной базы копией;
class DbProvider implements IProvider {
  static final DbProvider _instance = DbProvider._private();

  final String _calibreDbFileName = 'metadata.db';
  final String _appDbFileName = 'app.db';

  String _pathToCalibreFolder;
  Database _db;

  factory DbProvider() {
    return _instance;
  }

  void setPathToCalibreFolder(String path) async {
    if (path == _pathToCalibreFolder) {
      return;
    }
    _pathToCalibreFolder = path;
    if (_pathToCalibreFolder != null) {
      // await rawDelete(deleteCalibrePath);
    }
        print(await rawQuery('SELECT * FROM $tableAppSettings'));

    await rawInsert(insertCalibrePath, [path]);
  }

  DbProvider._private() {
    _open();
  }

  Future<String> _getPath() async {
    String databasesPath = await getDatabasesPath();
    return join(databasesPath, _appDbFileName);
  }

  Future<void> _createTables() {
    return _db.execute(createTables);
  }

  Future<void> _open() async {
    if (_db != null && _db.isOpen) {
      return;
    }
    String path = await _getPath();
    _db = await openDatabase(path);
    await _createTables();
  }

  // Future<void> _copy(String path) async {
  //   try {
  //     await Directory(dirname(path)).create(recursive: true);
  //   } catch (_) {}

  //   ByteData data = await rootBundle.load(join("assets", _appDbFileName));
  //   List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  //   await File(path).writeAsBytes(bytes, flush: true);
  // }

  // Future<void> _checkIfExist() async {
  //   String path = await _getPath();
  //   bool exists = await databaseExists(path);
  //   if (!exists) {
  //     await _open();
  //   }
  // }

  // Future<void> _checkAndOpen() async {
  //   await _checkIfExist();
  //   await _open();
  // }

  Future<Database> getInstance() async {
    if (_db == null) {
      await _open();
    }
    return _db;
  }

  Future<void> execute(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.execute(raw);
  }

  Future<List<Map<String, dynamic>>> rawQuery(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawQuery(raw);
  }

  Future<int> rawInsert(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawInsert(raw);
  }

  Future<int> rawUpdate(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawUpdate(raw);
  }

  Future<int> rawDelete(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawDelete(raw);
  }

  dispose() {
    if (_db == null) {
      return;
    }
    _db.close();
  }
}
