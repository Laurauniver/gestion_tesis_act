import 'package:drift/drift.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class PruebaDataSource {
  Future<List<PruebaTableEntity>> getAllPrueba();

  Future<PruebaTableEntity> getPruebaById(int id);

  Future<List<PruebaTableEntity>> getPruebaByTipo(String tipo);

}

class PruebaRepositoryImpl extends PruebaDataSource {
  PruebaRepositoryImpl(this._appDatabase);

  final AppDatabase _appDatabase;
  $PruebaEntityTable get pruebaEntity => _appDatabase.pruebaEntity;

  Future<void> insertPrueba(List<PruebaTableEntity> listPrueba) async {
    return await pruebaEntity.insertAll(listPrueba);
  }

  //Obtener todos
  @override
  Future<List<PruebaTableEntity>> getAllPrueba() async {
    return pruebaEntity.select().get();
  }

  @override
  Future<PruebaTableEntity> getPruebaById(int id) async {
    return await (_appDatabase.select(pruebaEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }


  @override
  Future<List<PruebaTableEntity>> getPruebaByTipo(String tipo) async {
    return await (_appDatabase.select(pruebaEntity)
          ..where((tbl) => tbl.tipo.equals(tipo))).get();
  }
  

}

  