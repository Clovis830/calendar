import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:calendar/src/services/service-locator.dart';
import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/loader/bloc/loader_bloc.dart';
import 'package:flutter/cupertino.dart';

class CalibreRepository {
  static final _instance = CalibreRepository._private();

  DbProvider _dbProvider = getService<DbProvider>();
  ErrorBloc _errorBloc;
  LoaderBloc _loaderBloc;

  factory CalibreRepository(BuildContext context) {
    _instance._errorBloc = BlocProvider.of<ErrorBloc>(context);
    _instance._loaderBloc = BlocProvider.of<LoaderBloc>(context);
    return _instance;
  }

  CalibreRepository._private();

  _rawQuery(String raw) async {
    Database db = await _dbProvider.getInstance();
    return db.rawQuery(raw);
  }

  _rawInsert(String raw) async {
    Database db = await _dbProvider.getInstance();
    return db.rawInsert(raw);
  }

  _rawUpdate(String raw) async {
    Database db = await _dbProvider.getInstance();
    return db.rawUpdate(raw);
  }

  _rawDelete(String raw) async {
    Database db = await _dbProvider.getInstance();
    return db.rawDelete(raw);
  }

  _doAndCheck(Function func, String sql) async {
    var data;
    _loaderBloc.add(LoaderEventShow());
    try {
      data = await Function.apply(func, [sql]);
      _loaderBloc.add(LoaderEventHide());
    } catch (error) {
      _loaderBloc.add(LoaderEventHide());
      _errorBloc.add(ErrorEventShow(error.message));
    }
    return data;
  }

  loadAllBooks() async {
    return _doAndCheck(_rawQuery, 'args');
  }
}
