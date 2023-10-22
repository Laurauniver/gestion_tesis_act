import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tesis_datasources.dart';
import 'package:gestion_tesis/src/domain/repositories/tesis_repository.dart';

class TesisRepositoryImpl extends TesisRepository {
  TesisRepositoryImpl(this._tesisDataSource);

  final TesisDataSource _tesisDataSource;

  @override
  Future<List<TesisTableEntity>> getAllTesis() async {
    return await _tesisDataSource.getAllTesis();
  }

  @override
  Future<List<TesisTableEntity>> getTesisByArea(String namearea) async {
    return await _tesisDataSource.getTesisByArea(namearea);
    
  }

  @override
  Future<TesisTableEntity> getTesisByAuthor(String author) async {
    return await _tesisDataSource.getTesisByAuthor(author);
    
  }

  @override
  Future<TesisTableEntity> getTesisById(int id) async{
    return await _tesisDataSource.getTesisById(id);
  }

  @override
  Future<TesisTableEntity> getTesisByTitle(String title) async{
    return await _tesisDataSource.getTesisByTitle(title);
    
  }

  @override
  Future<List<TesisTableEntity>> getTesisByYear(int year) async{
    return await _tesisDataSource.getTesisByYear(year);
    
  }
}
