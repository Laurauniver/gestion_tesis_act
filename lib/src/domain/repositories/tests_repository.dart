import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class TestsRepository {
  Future<List<PruebaTableEntity>> getAllPrueba();

  Future<PruebaTableEntity> getPruebaById(int id);

  Future<List<PruebaTableEntity>> getPruebaByTipo(String tipo);
}
