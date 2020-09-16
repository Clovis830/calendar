import 'package:calendar/src/services/service-locator.dart';

class CalibreRepository {
  getAuthors() {
    return getService<DbProvider>().query('authors');
  }
}
