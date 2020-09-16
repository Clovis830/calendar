part of 'repositories.dart';

class CalibreRepository extends IRepository {
  getAuthors() {
    return getService<DbProvider>().query('authors');
  }
}
