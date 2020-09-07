part of 'index.dart';

class RCalibre extends IRepository {
  getAuthors() {
    return getService<PDbCalibre>().query('authors');
  }
}
