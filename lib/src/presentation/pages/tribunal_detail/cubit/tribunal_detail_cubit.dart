import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:gestion_tesis/src/data/models/tribunal.dart';
import 'package:gestion_tesis/src/domain/repositories/tribunal_repository.dart';

part 'tribunal_detail_state.dart';
// part 'tribunal_detail_cubit.freezed.dart';

class TribunalDetailCubit extends Cubit<TribunalDetailState> {
  TribunalDetailCubit({required this.tribunalRepository})
      : super(TribunalDetailInitial());
  final TribunalRepository tribunalRepository;

  Future<void> getTribunalById(int tribunalId) async {
    emit(TribunalDetailLoading());
    try {
      final response = await tribunalRepository.getTribunalById(tribunalId);
      emit(TribunalDetailSuccessful(tribunal: response));
    } catch (e) {
      emit(TribunalDetailFailure(message: e.toString()));
    }
  }
}
// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'tribunal_detail_state.dart';
// part 'tribunal_detail_cubit.freezed.dart';

// class TribunalDetailCubit extends Cubit<TribunalDetailState> {
//   TribunalDetailCubit() : super(TribunalDetailState.initial());
// }
