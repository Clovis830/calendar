part of 'loader_bloc.dart';

@immutable
abstract class LoaderEvent extends Equatable {
  const LoaderEvent();
  List<Object> get props => [];
}

class LoaderEventShow extends LoaderEvent {}

class LoaderEventHide extends LoaderEvent {}
