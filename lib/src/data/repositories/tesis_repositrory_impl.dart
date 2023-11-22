import 'package:gestion_tesis/src/data/models/tesis.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tesis_remote_data_sources.dart';
import 'package:gestion_tesis/src/domain/repositories/tesis_repository.dart';

class TesisRepositoryImpl extends TesisRepository {
  TesisRepositoryImpl(this._tesisDataSource);

  final TesisRemoteDataSource _tesisDataSource;

  @override
  Future<List<TesisModel>> getAllTesis({String? titulo}) async {
    return await _tesisDataSource.getAllTesis(titulo: titulo);
  } 

  @override
  Future<TesisModel> getTesisById(int id) async{
    return await _tesisDataSource.getTesisById(id);
  }
}
