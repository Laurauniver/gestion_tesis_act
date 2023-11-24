import 'package:gestion_tesis/src/data/models/no_conformidad.dart';

abstract class NoConformidadRepository {
  Future<List<NoConformidad>> getAllNoConformidad();

  Future<NoConformidad> getNoConformidadById(int id);
}