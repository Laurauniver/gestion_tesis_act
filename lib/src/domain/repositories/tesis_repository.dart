import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class TesisRepository {
  Future<List<TesisTableEntity>> getAllTesis();

  Future<TesisTableEntity> getTesisById(int id);

  Future<TesisTableEntity> getTesisByAuthor(String author);

  Future<TesisTableEntity> getTesisByTitle(String title);

  Future<List<TesisTableEntity>> getTesisByArea(String namearea);

  Future<List<TesisTableEntity>> getTesisByYear(int year);
}
