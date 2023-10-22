import 'package:drift/drift.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class TribunalDataSource {
  Future<List<TribunalTableEntity>> getAllTribunal();

  Future<TribunalTableEntity> getTribunalByPresident(String namePresident);

  Future<TribunalTableEntity> getTribunalById(int id);

}

class TribunalRepositoryImpl extends TribunalDataSource{
TribunalRepositoryImpl(this._appDatabase);

  final AppDatabase _appDatabase;
  $TribunalEntityTable get tribunalEntity => _appDatabase.tribunalEntity;

  Future<void> insertTribunal(List<TribunalTableEntity> listTribunal)async {
   return await tribunalEntity.insertAll(listTribunal);
    
  }

  @override
  Future<List<TribunalTableEntity>> getAllTribunal() {
    return tribunalEntity.select().get();
  }
  @override
  Future<TribunalTableEntity> getTribunalByPresident(String namePresident) async {
    return await (_appDatabase.select(tribunalEntity)
          ..where((tbl) => tbl.presidente.equals(namePresident)))
        .getSingle();
  }
  
  @override
  Future<TribunalTableEntity> getTribunalById(int id) async{
    return await (_appDatabase.select(tribunalEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    
  
}
  

}