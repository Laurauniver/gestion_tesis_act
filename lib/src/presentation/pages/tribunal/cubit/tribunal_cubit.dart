import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tribunal_datasources.dart';

part 'tribunal_state.dart';

class TribunalCubit extends Cubit<TribunalState> {
  TribunalCubit(this._tribunalDataSource) : super(TribunalInitial());

  final TribunalDataSource _tribunalDataSource;

  Future<void> getAllTribunal() async{
    emit(TribunalLoading());
    try {
      final response = await _tribunalDataSource.getAllTribunal();
      emit(TribunalSuccessful(tribunal: response));
    } catch (e) {
      emit(TribunalFailure(message: e.toString()));
    }
  }
}
