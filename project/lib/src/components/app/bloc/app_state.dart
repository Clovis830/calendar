part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {
  final String pathToCalibre;
  const AppState({this.pathToCalibre});

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  const AppInitial() : super(pathToCalibre: null);

  @override
  List<Object> get props => [pathToCalibre];
}
