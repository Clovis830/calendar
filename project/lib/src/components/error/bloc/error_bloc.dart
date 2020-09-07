import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(ErrorState.cleared());

  @override
  Stream<ErrorState> mapEventToState(
    ErrorEvent event,
  ) async* {
    if (event is ErrorEventShow) {
      yield ErrorState.withError(event.message);
    } else if (event is ErrorEventHide) {
      yield ErrorState.cleared();
    }
  }

  @override
  void onTransition(Transition<ErrorEvent, ErrorState> transition) {
    if (transition.event is ErrorEventShow) {
      Future.delayed(Duration(seconds: 5), () {
        this.add(ErrorEventHide());
      });
    }
    super.onTransition(transition);
  }
}
