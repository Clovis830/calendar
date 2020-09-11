part of 'loader_bloc.dart';

@immutable
abstract class LoaderEvent extends Equatable {
  const LoaderEvent();
  List<Object> get props => [];
}

class LoaderActiveEvent extends LoaderEvent {}

class LoaderInActiveEvent extends LoaderEvent {}
