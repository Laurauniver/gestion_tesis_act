import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/models/tesis.dart';
import 'package:gestion_tesis/src/domain/repositories/tesis_repository.dart';

part 'tesis_detail_state.dart';

class TesisDetailCubit extends Cubit<TesisDetailState> {
  TesisDetailCubit({required this.tesisRepository})
      : super(TesisDetailInitial());
  final TesisRepository tesisRepository;

  Future<void> getTesisById(int tesisId) async {
    emit(TesisDetailLoading());
    try {
      final response = await tesisRepository.getTesisById(tesisId);
      emit(TesisDetailSuccessful(tesis: response));
    } catch (e) {
      emit(TesisDetailFailure(message: e.toString()));
    }
  }
}
