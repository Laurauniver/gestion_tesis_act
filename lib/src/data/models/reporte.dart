import 'package:gestion_tesis/src/data/models/tutor_model.dart';

class Reporte {
  final int id;
  final List<TutorModel> tutores;

  Reporte({
    required this.id,
    required this.tutores,
  });
}
