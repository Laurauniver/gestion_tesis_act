import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class TutorRepository {
  Future<List<TutorTableEntity>> getAllTutor();

  Future<TutorTableEntity> getTutorById(int id);

  Future<List<TutorTableEntity>> getTutorByName(String name);

  Future<List<TutorTableEntity>> getTutorByLastName(String lastName);
}
