import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tesis_datasources.dart';


part 'tesis_state.dart';

class TesisCubit extends Cubit<TesisState> {
  TesisCubit( this._tesisDataSource) : super(TesisInitial());
  final TesisDataSource _tesisDataSource;

  Future<void> getAllTesis() async {
    emit(TesisLoading());
    try {
      final response = await _tesisDataSource.getAllTesis();
      emit(TesisSuccessful(tesis: response));
    } catch (e) {
      emit(TesisFailure(message: e.toString()));
    }
  }
}

