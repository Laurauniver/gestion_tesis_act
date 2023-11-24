import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/models/tribunal.dart';
import 'package:gestion_tesis/src/domain/repositories/tribunal_repository.dart';

part 'tribunal_state.dart';

class TribunalCubit extends Cubit<TribunalState> {
  TribunalCubit({required this.tribunalRepository}) : super(TribunalInitial());

  final TribunalRepository tribunalRepository;

  Future<void> getAllTribunal() async{
    emit(TribunalLoading());
    try {
      final response = await tribunalRepository.getAllTribunal();
      emit(TribunalSuccessful(tribunal: response));
    } catch (e) {
      emit(TribunalFailure(message: e.toString()));
    }
  }
}
