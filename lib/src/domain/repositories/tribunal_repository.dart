import 'package:gestion_tesis/src/data/models/tribunal.dart';

abstract class TribunalRepository {
  Future<List<Tribunal>> getAllTribunal();

  Future<Tribunal> getTribunalById(int id);

 // Future<Tribunal> getTribunalByPresident(String namePresident);
}
