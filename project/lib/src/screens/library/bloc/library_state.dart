part of 'library_bloc.dart';

@immutable
abstract class LibraryState {
  const LibraryState();
  List<Object> get props => [];
}

class LibraryInitial extends LibraryState {}

class LibraryStateDataLoading extends LibraryState {}
