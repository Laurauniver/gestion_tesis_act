import 'package:drift/drift.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';

class TesisDataSource {
  TesisDataSource(this._appDatabase);

  final AppDatabase _appDatabase;
  $TesisEntityTable get tesisEntity => _appDatabase.tesisEntity;

  Future<void> insertTesis(List<TesisTableEntity> listTesis) async {
    await tesisEntity.insertAll(listTesis);
  }

  //Obtener todos
  @override
  Future<List<TesisTableEntity>> getAllTesis() async {
    return tesisEntity.select().get();
  }

  @override
  Future<TesisTableEntity> getTesisById(int id) async {
    return await (_appDatabase.select(tesisEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  @override
  Future<TesisTableEntity> getTesisByAuthor(String author) async {
    return await (_appDatabase.select(tesisEntity)
          ..where((tbl) => tbl.autor.equals(author)))
        .getSingle();
  }

  @override
  Future<List<TesisTableEntity>> getTesisByArea(String area) async {
    return await (_appDatabase.select(tesisEntity)
          ..where((tbl) => tbl.area.equals(area)))
        .get();
  }

  @override
  Future<TesisTableEntity> getTesisByTitle(String title) async {
    return await (_appDatabase.select(tesisEntity)
          ..where((tbl) => tbl.titulo.equals(title)))
        .getSingle();
  }

  @override
  Future<List<TesisTableEntity>> getTesisByYear(int year) async {
    return await (_appDatabase.select(tesisEntity)
          ..where((tbl) => tbl.ano.equals(year)))
        .get();
  }
}
