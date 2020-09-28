import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/repositories/repositories.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final CalibreRepository _calibreRepository;

  LibraryBloc(BuildContext context)
      : _calibreRepository = RepositoryProvider.of<CalibreRepository>(context),
        super(LibraryInitial());

  @override
  Stream<LibraryState> mapEventToState(
    LibraryEvent event,
  ) async* {
    if (event is LibraryEventLoadData) {
      final books = await _calibreRepository.loadAllBooks();
      print('bools - $books');
    }
    // TODO: implement mapEventToState
  }
}
