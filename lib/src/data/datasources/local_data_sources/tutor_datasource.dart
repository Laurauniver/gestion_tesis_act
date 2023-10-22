import 'package:drift/drift.dart';
import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class TutorDataSource {
  Future<List<TutorTableEntity>> getAllTutor();

  Future<TutorTableEntity> getTutorById(int id);

  Future<List<TutorTableEntity>> getTutorByName(String name);

  Future<List<TutorTableEntity>> getTutorByLastName(String lastName);

}

class TutorRepositoryImpl extends TutorDataSource{
  TutorRepositoryImpl (this._appDatabase);

  final AppDatabase _appDatabase;
  $TutorEntityTable get tutorEntity => _appDatabase.tutorEntity;

  Future<void> insertTutor(List<TutorTableEntity> listTutor) async {
    await tutorEntity.insertAll(listTutor);
  }

  @override
  Future<List<TutorTableEntity>> getAllTutor() async{
    return await tutorEntity.select().get();
    
  }
  
  @override
  Future<TutorTableEntity> getTutorById(int id) async{
    return await (_appDatabase.select(tutorEntity)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    
  }

  @override
  Future<List<TutorTableEntity>> getTutorByName(String name) async{
    return await (_appDatabase.select(tutorEntity)
    ..where((tbl) => tbl.nombre.equals(name))).get();
    
  }
  
  @override
  Future<List<TutorTableEntity>> getTutorByLastName(String lastName) async{
    return await (_appDatabase.select(tutorEntity)
    ..where((tbl) => tbl.apellidos.equals(lastName))).get();
  }
  
  


}