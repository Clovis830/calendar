part of 'index.dart';

class DbCalibre extends IProvider {
  static final DbCalibre _instance = DbCalibre._private();
  static final pathToDb = 'calibre/metadata.db';
  Database _db;

  factory DbCalibre() {
    return _instance;
  }

  DbCalibre._private() {
    _checkAndOpen();
  }

  Future<String> _getPath() async {
    String databasesPath = await getDatabasesPath();
    return join(databasesPath, pathToDb);
  }

  Future<void> _open() async {
    if (_db != null && _db.isOpen) {
      return;
    }
    String path = await _getPath();
    _db = await openDatabase(path);
  }

  Future<void> _copy(String path) async {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    ByteData data = await rootBundle.load(join("assets", pathToDb));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(path).writeAsBytes(bytes, flush: true);
  }

  // copy db from android storage or one drive
  Future<void> _copyFrom() async {}

  Future<void> _checkIfExist() async {
    String path = await _getPath();
    bool exists = await databaseExists(path);
    print('exist $exists');
    if (!exists) {
      await _copy(path);
    }
  }

  Future<void> _checkAndOpen() async {
    await _checkIfExist();
    await _open();
  }

  @override
  Future<Database> getInstance() async {
    if (_db == null) {
      await _checkAndOpen();
    }
    return _db;
  }

  //update original db
  update() {
    print('update original db');
  }

  Future<List<Map<String, dynamic>>> query(String table, [Map<dynamic, dynamic> arguments]) async {
    Database db = await getInstance();
    if (db == null) {
      return null;
    }
    return Function.apply(db.query, [table], arguments);
  }
}
