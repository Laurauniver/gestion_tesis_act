import 'package:gestion_tesis/src/data/models/tribunal.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tribunal_remote_data_source.dart';
import 'package:gestion_tesis/src/domain/repositories/tribunal_repository.dart';

class TribunalRepositoryImpl extends TribunalRepository {
  TribunalRepositoryImpl(this._tribunalDatasource);

  final TribunalRemoteDataSource _tribunalDatasource;

  @override
  Future<List<Tribunal>> getAllTribunal() async {
    return await _tribunalDatasource.getAllTribunal();
  }
  
  @override
  Future<Tribunal> getTribunalById(int id) async{
    return await _tribunalDatasource.getTribunalById(id);
  }

  // @override
  // Future<Tribunal> getTribunalByPresident (
  //     String namePresident) async {
  //       return await _tribunalDatasource.getTribunalByPresident(namePresident);
    
  // }
}
