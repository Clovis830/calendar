import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderStateInActive());

  @override
  Stream<LoaderState> mapEventToState(
    LoaderEvent event,
  ) async* {
    if (event is LoaderActiveEvent) {
      yield LoaderStateActive();
    }
    if (event is LoaderInActiveEvent) {
      yield LoaderStateInActive();
    }
  }
}
