import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class NoConformidadRepository {
  Future<List<NoConformidadTableEntity>> getAllNoConformidad();

  Future<NoConformidadTableEntity> getNoConformidadById(int id);
}