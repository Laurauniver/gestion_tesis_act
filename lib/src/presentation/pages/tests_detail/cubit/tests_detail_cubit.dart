import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/models/prueba.dart';
import 'package:gestion_tesis/src/domain/repositories/tests_repository.dart';

part 'tests_detail_state.dart';

class TestsDetailCubit extends Cubit<TestsDetailState> {
  TestsDetailCubit({required this.testsRepository})
      : super(TestsDetailInitial());
  final TestsRepository testsRepository;

  Future<void> getPruebaById(int testsId) async {
    emit(TestsDetailLoading());
    try {
      final response = await testsRepository.getPruebaById(testsId);
      emit(TestsDetailSuccessful(tests: response));
    } catch (e) {
      emit(TestsDetailFailure(message: e.toString()));
    }
  }
}
