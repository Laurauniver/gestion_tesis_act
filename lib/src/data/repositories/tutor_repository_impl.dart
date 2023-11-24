import 'package:gestion_tesis/src/data/models/tutor_model.dart';
import 'package:gestion_tesis/src/data/remote_data_source/tutor_remote_data_source.dart';
import 'package:gestion_tesis/src/domain/repositories/tutor_repository.dart';

class TutorRepositoryImpl extends TutorRepository{
  TutorRepositoryImpl(this._tutorDataSource);
  final TutorRemoteDataSource _tutorDataSource;
  @override
  Future<List<TutorModel>> getAllTutor()async{
    return await _tutorDataSource.getAllTutor();
    
  }

  @override
  Future<TutorModel> getTutorById(int id) async{
    return await _tutorDataSource.getTutorById(id);
    
  }

  // @override
  // Future<List<TutorModel>> getTutorByLastName(String lastName) async{
  //   return await _tutorDataSource.getTutorByLastName(lastName);
   
  // }

  // @override
  // Future<List<TutorModel>> getTutorByName(String name) async{
  //   return await _tutorDataSource.getTutorByName(name);
    
  // }
  
}