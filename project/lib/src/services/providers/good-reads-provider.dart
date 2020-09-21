part of 'providers.dart';

/// класс для работы с API GoodReads
class GoodReadsProvider implements IProvider {
  static final GoodReadsProvider _instance = GoodReadsProvider._private();
  final _transport = RestProvider();
  String _apiUrl;
  String _apiKey;

  GoodReadsProvider._private();

  factory GoodReadsProvider(Map<String, String> config) {
    _instance._apiUrl = config['api'];
    _instance._apiKey = config['key'];
    return _instance;
  }

  getAuthors() {
    return _transport.request(method: 'get', url: '$_apiUrl/get-authors?key=$_apiKey');
  }
}