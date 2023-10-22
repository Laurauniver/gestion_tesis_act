import 'package:gestion_tesis/src/data/datasources/db/database.dart';

abstract class TribunalRepository {
  Future<List<TribunalTableEntity>> getAllTribunal();

  Future<TribunalTableEntity> getTribunalByPresident(String namePresident);
}
