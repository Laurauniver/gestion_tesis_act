import 'package:gestion_tesis/src/data/models/prueba.dart';

abstract class TestsRepository {
  Future<List<Prueba>> getAllPrueba();

  Future<Prueba> getPruebaById(int id);

}
