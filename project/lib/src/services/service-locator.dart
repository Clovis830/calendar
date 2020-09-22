import 'package:bloc/bloc.dart';

import 'package:calendar/src/services/providers/providers.dart';
import 'package:calendar/src/services/observers/event-observer.dart';

export 'package:calendar/src/services/providers/providers.dart';

final Set<dynamic> _container = {};

void initServices(networkConfig) {
  Bloc.observer = EventObserver();
  initProviders(_container, networkConfig);
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
