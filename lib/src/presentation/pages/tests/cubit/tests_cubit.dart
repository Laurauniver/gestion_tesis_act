import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tests_datasource.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit(this._pruebaDataSource) : super(TestsInitial());

  final TestsDataSource _pruebaDataSource;

  Future<void> getAllPrueba() async{
    emit(TestsLoading());
    try {
      final response = await _pruebaDataSource.getAllPrueba();
      emit(TestsSuccessful(tests: response));
    } catch (e) {
      emit(TestsFailure(message: e.toString()));
    }

  }
}

