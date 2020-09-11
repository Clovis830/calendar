part of 'loader_bloc.dart';

@immutable
abstract class LoaderState extends Equatable {
  final bool isActive;

  const LoaderState(this.isActive);

  List<Object> get props => [isActive];
}

class LoaderStateActive extends LoaderState {
  const LoaderStateActive() : super(true);
}

class LoaderStateInActive extends LoaderState {
  const LoaderStateInActive() : super(false);
}
