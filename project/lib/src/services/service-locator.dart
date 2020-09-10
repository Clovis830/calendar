import 'package:bloc/bloc.dart';

import 'package:calendar/src/services/providers/index.dart';
import 'package:calendar/src/services/repositories/index.dart';
export 'package:calendar/src/services/repositories/index.dart';
export 'package:calendar/src/services/providers/index.dart';
import 'package:calendar/src/services/observers/test.dart';

final Set<dynamic> _container = {};

void initServices() {
  Bloc.observer = SimpleBlocObserver();
  initProviders(_container);
  initRepositories(_container);
}

setService(dynamic service) {
  _container.add(service);
}

T getService<T>() {
  Iterable<T> values = _container.whereType<T>();
  if (values.isEmpty) {
    print('Error! Service with type $T not found!');
  }
  return values.single;
}
