import 'dart:async';

class PathController {
  final _pathStreamController = StreamController<String>();
  Stream<String> get pathUpdate => _pathStreamController.stream;

  void savePath(String path) {
    _pathStreamController.add(path);
  }

  void dispose() {
    print('dispose contriller');
    _pathStreamController.close();
  }
}
