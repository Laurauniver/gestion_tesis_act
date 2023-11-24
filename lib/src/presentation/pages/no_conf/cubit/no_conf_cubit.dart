import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/models/no_conformidad.dart';
import 'package:gestion_tesis/src/domain/repositories/no_conf_repository.dart';

part 'no_conf_state.dart';

class NoConformidadCubit extends Cubit<NoConformidadState> {
  NoConformidadCubit({
    required this.noConformidadRepository,
  }) : super(NoConformidadInitial());

  final NoConformidadRepository noConformidadRepository;

  Future<void> getAllNoConformidad() async {
    emit(NoConformidadLoading());
    try {
      final response = await noConformidadRepository.getAllNoConformidad();
      emit(NoConformidadSuccessful(noConformidad: response));
    } catch (e) {
      emit(NoConformidadFailure(message: e.toString()));
    }
  }
}
