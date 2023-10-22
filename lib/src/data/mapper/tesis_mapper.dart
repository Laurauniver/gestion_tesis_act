import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/models/tesis.dart';

class TesisMapper {
  static TesisModel entityToModel(TesisTableEntity tesisEntity) {
    return TesisModel(
        tutorId: tesisEntity.tutorId,
        id: tesisEntity.id,
        autor: tesisEntity.autor,
        ano: tesisEntity.ano,
        titulo: tesisEntity.titulo,
        area: tesisEntity.area);
  }
}
