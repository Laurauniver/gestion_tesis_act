import 'package:drift/drift.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class NoConformidadDataSource {
  Future<List<NoConformidadTableEntity>> getAllNoConformidad();

  Future<NoConformidadTableEntity> getNoConformidadById(int id);
}

class NoConformidadRepositoryImpl extends NoConformidadDataSource{
NoConformidadRepositoryImpl(this._appDatabase);

  final AppDatabase _appDatabase;
  $NoConformidadEntityTable get noConformidadEntity => _appDatabase.noConformidadEntity;

  Future<void> insertNoConformidad(List<NoConformidadTableEntity> listNoConformidad)async {
    await noConformidadEntity.insertAll(listNoConformidad);
    
  }

  Future<List<NoConformidadTableEntity>> getAllNoConformidad() {
    return noConformidadEntity.select().get();
  }
  @override
  Future<NoConformidadTableEntity> getNoConformidadById(int id) async {
    return await (_appDatabase.select(noConformidadEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }
  

}