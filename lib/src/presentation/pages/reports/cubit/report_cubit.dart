import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/models/tutor_model.dart';
import 'package:gestion_tesis/src/domain/repositories/tutor_repository.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit({required this.tutorRepository}) : super(ReportInitial());

  final TutorRepository tutorRepository;

  Future<void> getAllTutor() async {
    emit(ReportLoading());
    try {
      final response = await tutorRepository.getAllTutor();
      emit(ReportsSuccessful(tutors: response));
    } catch (e) {
      emit(ReportFailure(message: e.toString()));
    }
  }
}
