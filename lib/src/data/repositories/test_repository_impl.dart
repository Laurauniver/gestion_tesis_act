import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tests_datasource.dart';
import 'package:gestion_tesis/src/domain/repositories/tests_repository.dart';

class TestsRepositoryImpl extends TestsRepository {
  TestsRepositoryImpl(this._pruebaDatasource);

  final TestsDataSource _pruebaDatasource;

  @override
  Future<List<PruebaTableEntity>> getAllPrueba() async {
    return await _pruebaDatasource.getAllPrueba();
  }

  @override
  Future<PruebaTableEntity> getPruebaById(int id) async{
    return await _pruebaDatasource.getPruebaById(id);
  }

  @override
  Future<List<PruebaTableEntity>> getPruebaByTipo (
      String tipo) async {
        return await _pruebaDatasource.getPruebaByTipo(tipo);

  }
}
