import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/no_conf_datasource.dart';

part 'no_conf_state.dart';

class NoConformidadCubit extends Cubit<NoConformidadState> {
  NoConformidadCubit(this._noConformidadDataSource) : super(NoConformidadInitial());
  final NoConformidadDataSource _noConformidadDataSource;

  Future<void> getAllNoConformidad () async{
    emit(NoConformidadLoading());
    try {
      final response = await _noConformidadDataSource.getAllNoConformidad();
      emit(NoConformidadSuccessful(noConformidad: response));
    } catch (e) {
      emit(NoConformidadFailure(message: e.toString()));
    }
  }
  }
