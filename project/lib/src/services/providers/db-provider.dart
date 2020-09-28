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

  DbProvider._private() {
    _initialize();
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
  }

  Future<void> _initialize() async {
    await _open();
    if (_db != null) {
      await _createTables();
    }
  }

  void setPathToCalibreFolder(String path) async {
    if (path == _pathToCalibreFolder) {
      return;
    }
    var lastSavedPath = await rawQuery(selectDbPath);

    if (lastSavedPath.isNotEmpty) {
      await rawDelete(deleteCalibrePath);
    }

    await rawInsert(insertCalibrePath, [calibreColumnName, path]);
    _pathToCalibreFolder = path;
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
    return db.execute(raw, values);
  }

  Future<List<Map<String, dynamic>>> rawQuery(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawQuery(raw, values);
  }

  Future<int> rawInsert(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawInsert(raw, values);
  }

  Future<int> rawUpdate(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawUpdate(raw, values);
  }

  Future<int> rawDelete(String raw, [List<dynamic> values]) async {
    Database db = await getInstance();
    return db.rawDelete(raw, values);
  }

  dispose() {
    if (_db == null) {
      return;
    }
    _db.close();
  }
}
