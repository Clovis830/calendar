part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  final String pathToCalibre;
  const AppState({this.pathToCalibre});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '${super.toString()} with params: { pathToCalibre: $pathToCalibre }';
  }
}

class AppInitial extends AppState {
  const AppInitial() : super(pathToCalibre: null);

  @override
  List<Object> get props => [pathToCalibre];
}

class AppStateWithPath extends AppState {
  const AppStateWithPath(pathToCalibre) : super(pathToCalibre: pathToCalibre);

  @override
  List<Object> get props => [pathToCalibre];
}
