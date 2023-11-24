import 'package:gestion_tesis/src/data/models/prueba.dart';
import 'package:gestion_tesis/src/domain/repositories/tests_repository.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tests_remote_data_sources.dart';

class TestsRepositoryImpl extends TestsRepository {
  TestsRepositoryImpl(this._pruebaDatasource);

  final TestsRemoteDataSource _pruebaDatasource;

  @override
  Future<List<Prueba>> getAllPrueba() async {
        return await _pruebaDatasource.getAllPrueba();
  }

  @override
  Future<Prueba> getPruebaById(int id) async{
    return await _pruebaDatasource.getPruebaById(id);
  }

}
