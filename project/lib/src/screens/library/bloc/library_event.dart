part of 'library_bloc.dart';

@immutable
abstract class LibraryEvent extends Equatable {
  const LibraryEvent();

  List<Object> get props => [];
}

@immutable
class LibraryEventLoadData extends LibraryEvent {}
