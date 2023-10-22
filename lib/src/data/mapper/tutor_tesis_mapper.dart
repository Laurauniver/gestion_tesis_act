import 'package:gestion_tesis/src/data/models/tesis.dart';
import 'package:gestion_tesis/src/data/models/tutor_model.dart';
import 'package:gestion_tesis/src/domain/entities/tutor_tesis_entity.dart';

class TutorTesisMapper {
  static TutorTesisEntity tableToEntity(
      TutorModel tutor, List<TesisModel> tesis) {
    return TutorTesisEntity(
      tutor: tutor,
      tesis: tesis,
    );
  }
}
