part of 'error_bloc.dart';

@immutable
class ErrorState extends Equatable {
  final String message;

  const ErrorState._(this.message);

  const ErrorState.withError(String message) : this._(message);

  const ErrorState.cleared() : this._(null);

  @override
  List<Object> get props => [message];
}
