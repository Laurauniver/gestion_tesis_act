import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_tesis/src/data/models/prueba.dart';
import 'package:gestion_tesis/src/domain/repositories/tests_repository.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit({required this.testsRepository}) : super(TestsInitial());

  final TestsRepository testsRepository;

  Future<void> getAllPrueba({String? tipo}) async{
    emit(TestsLoading());
    try {
      final response = await testsRepository.getAllPrueba();
      emit(TestsSuccessful(tests: response));
    } catch (e) {
      emit(TestsFailure(message: e.toString()));
    }

  }
}

