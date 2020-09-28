import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'package:calendar/src/repositories/repositories.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CalibreRepository _calibreRepository;

  AppBloc(this._calibreRepository) : super(AppInitial());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppEventWithPath) {
      yield AppStateWithPath(event.path);
    }
  }

  @override
  String toString() {
    return 'app/bloc/app_bloc.dart';
  }
}
