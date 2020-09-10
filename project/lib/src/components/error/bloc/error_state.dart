part of 'error_bloc.dart';

@immutable
abstract class ErrorState extends Equatable {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class ErrorStateActive extends ErrorState {
  const ErrorStateActive(String message) : super(message);
}

class ErrorStateEmpty extends ErrorState {
  const ErrorStateEmpty() : super(null);
}
