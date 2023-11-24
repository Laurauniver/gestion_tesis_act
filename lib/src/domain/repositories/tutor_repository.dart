import 'package:gestion_tesis/src/data/models/tutor_model.dart';

abstract class TutorRepository {
  Future<List<TutorModel>> getAllTutor();

  Future<TutorModel> getTutorById(int id);

//   Future<List<TutorModel>> getTutorByName(String name);

//   Future<List<TutorModel>> getTutorByLastName(String lastName);
// 
}
