import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:flutter/cupertino.dart';

import 'package:calendar/src/services/service-locator.dart';
import 'package:calendar/src/components/error/index.dart';
import 'package:calendar/src/components/loader/bloc/loader_bloc.dart';

import 'package:calendar/src/services/providers/sql/sql.dart';

class CalibreRepository {
  static final _instance = CalibreRepository._private();

  DbProvider _dbProvider = getService<DbProvider>();
  ErrorBloc _errorBloc;
  LoaderBloc _loaderBloc;

  factory CalibreRepository(ErrorBloc errorBloc, LoaderBloc loaderBloc) {
    _instance._errorBloc = errorBloc;
    _instance._loaderBloc = loaderBloc;
    return _instance;
  }

  CalibreRepository._private();

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
    return _doAndCheck(_dbProvider.rawQuery, 'select * from AppSettings');
  }
}
