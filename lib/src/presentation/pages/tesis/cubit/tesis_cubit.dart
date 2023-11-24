import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/models/tesis.dart';
import 'package:gestion_tesis/src/domain/repositories/tesis_repository.dart';

part 'tesis_state.dart';

class TesisCubit extends Cubit<TesisState> {
  TesisCubit({required this.tesisRepository}) : super(TesisInitial());
  final TesisRepository tesisRepository;

  Future<void> getAllTesis({String? titulo}) async {
    emit(TesisLoading());
    try {
      final response = await tesisRepository.getAllTesis(titulo: titulo);
      emit(TesisSuccessful(tesis: response));
    } catch (e) {
      emit(TesisFailure(message: e.toString()));
    }
  }
}
