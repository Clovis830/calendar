part of 'providers.dart';

/// провайдер для работы с базой данной калибре;
/// копирование оригинальной базы в приложение;
/// изменение копии;
/// обновление оригинальной базы копией;
class DbProvider implements IProvider {
  static final DbProvider _instance = DbProvider._private();

  final String _calibreDbFileName = 'metadata.db';
  final String _appDbFileName = 'app.db';

  String _pathToCalibreFolder = 'calibre/metadata.db';
  Database _db;

  factory DbProvider() {
    return _instance;
  }

  void setPathToCalibreFolder(String path) {
    if (path == _pathToCalibreFolder) {
      return;
    }
    _pathToCalibreFolder = path;
  }

  DbProvider._private() {
    _open();
  }

  Future<String> _getPath() async {
    String databasesPath = await getDatabasesPath();
    return join(databasesPath, _appDbFileName);
  }

  Future<void> _open() async {
    if (_db != null && _db.isOpen) {
      return;
    }
    String path = await _getPath();
    _db = await openDatabase(path);
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

  Future<List<Map<String, dynamic>>> query(String table, [Map<dynamic, dynamic> arguments]) async {
    Database db = await getInstance();
    if (db == null) {
      return null;
    }
    return Function.apply(db.query, [table], arguments);
  }
}
