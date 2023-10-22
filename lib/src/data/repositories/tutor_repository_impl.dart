import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/datasources/local_data_sources/tutor_datasource.dart';
import 'package:gestion_tesis/src/domain/repositories/tutor_repository.dart';

class TutorRepositoryImpl extends TutorRepository{
  TutorRepositoryImpl(this._tutorDataSource);
  final TutorDataSource _tutorDataSource;
  @override
  Future<List<TutorTableEntity>> getAllTutor()async{
    return await _tutorDataSource.getAllTutor();
    
  }

  @override
  Future<TutorTableEntity> getTutorById(int id) async{
    return await _tutorDataSource.getTutorById(id);
    
  }

  @override
  Future<List<TutorTableEntity>> getTutorByLastName(String lastName) async{
    return await _tutorDataSource.getTutorByLastName(lastName);
   
  }

  @override
  Future<List<TutorTableEntity>> getTutorByName(String name) async{
    return await _tutorDataSource.getTutorByName(name);
    
  }
  
}