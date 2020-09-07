part of 'index.dart';

class PRest extends IProvider {
  static final PRest _instance = PRest._private();

  factory PRest() {
    return _instance;
  }

  PRest._private() {
    _init();
  }

  _init() {}

  @override
  Future<dynamic> getInstance() async {}
}
