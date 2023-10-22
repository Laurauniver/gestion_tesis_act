import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tribunal_datasources.dart';
import 'package:gestion_tesis/src/domain/repositories/tribunal_repository.dart';

class TribunalRepositoryImpl extends TribunalRepository {
  TribunalRepositoryImpl(this._tribunalDatasource);

  final TribunalDataSource _tribunalDatasource;

  @override
  Future<List<TribunalTableEntity>> getAllTribunal() async {
    return await _tribunalDatasource.getAllTribunal();
  }
  
  Future<TribunalTableEntity> getTribunalById(int id) async{
    return await _tribunalDatasource.getTribunalById(id);
  }

  @override
  Future<TribunalTableEntity> getTribunalByPresident (
      String namePresident) async {
        return await _tribunalDatasource.getTribunalByPresident(namePresident);
    
  }
}
