part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeEventStarted extends HomeEvent {
  @override
  List<Object> get props => [];
}
