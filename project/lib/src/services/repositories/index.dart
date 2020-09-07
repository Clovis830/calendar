import 'package:calendar/src/services/service-locator.dart';

part 'calibre.dart';
part 'i-repository.dart';

void initRepositories(Set<dynamic> container) {
  container.addAll([RCalibre()]);
}
