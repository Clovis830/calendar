part of 'index.dart';

class Rest extends IProvider {
  static final Rest _instance = Rest._private();

  factory Rest() {
    return _instance;
  }

  Rest._private() {
    _init();
  }

  _init() {}
}
