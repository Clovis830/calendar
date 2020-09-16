import 'package:bloc/bloc.dart';

import 'package:calendar/src/services/providers/providers.dart';
import 'package:calendar/src/services/repositories/repositories.dart';
import 'package:calendar/src/services/observers/test.dart';

export 'package:calendar/src/services/providers/providers.dart';
export 'package:calendar/src/services/repositories/repositories.dart';

final Set<dynamic> _container = {};

void initServices(networkConfig) {
  Bloc.observer = SimpleBlocObserver();
  initProviders(_container, networkConfig);
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
