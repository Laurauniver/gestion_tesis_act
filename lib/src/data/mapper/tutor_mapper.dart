import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/models/tutor_model.dart';

class TutorMapper {
  static TutorModel entityToModel(TutorTableEntity tutorEntity) {
    return TutorModel(
      id: tutorEntity.id,
      nombre: tutorEntity.nombre,
      apellidos: tutorEntity.apellidos,
    );
  }
}
