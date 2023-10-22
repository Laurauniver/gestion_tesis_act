import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/report_datasources.dart';
import 'package:gestion_tesis/src/domain/entities/tutor_tesis_entity.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit(this._reportDataSources) : super(ReportInitial());

  final ReportDataSources _reportDataSources;

  Future<void> getAllTutorWithTesis() async {
    emit(ReportLoading());
    try {
      final response = await _reportDataSources.getAllTutorWithTesis();
      emit(ReportsSuccessful(tutorsWithTesis: response));
    } catch (e) {
      emit(ReportFailure(message: e.toString()));
    }
  }
}
