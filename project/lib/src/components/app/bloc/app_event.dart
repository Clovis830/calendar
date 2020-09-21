part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppEventWithPath extends AppEvent {
  final String path;
  const AppEventWithPath(this.path);

  List<Object> get props => [path];
}
