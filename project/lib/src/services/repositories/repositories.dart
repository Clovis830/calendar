import 'package:calendar/src/services/service-locator.dart';

part 'calibre-repository.dart';
part 'i-repository.dart';

void initRepositories(Set<dynamic> container) {
  container.addAll([CalibreRepository()]);
}
