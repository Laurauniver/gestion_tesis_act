import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/no_conf_datasource.dart';
import 'package:gestion_tesis/src/domain/repositories/no_conf_repository.dart';


class NoConformidadRepositoryImpl extends NoConformidadRepository {
  NoConformidadRepositoryImpl(this._noConformidadDatasource);

  final NoConformidadDataSource _noConformidadDatasource;


  @override
  Future<NoConformidadTableEntity> getNoConformidadById (
      int id) async {
        return await _noConformidadDatasource.getNoConformidadById(id);
    
  }
  
  
  @override
  Future<List<NoConformidadTableEntity>> getAllNoConformidad() async{
    return await _noConformidadDatasource.getAllNoConformidad();
    
  }
}