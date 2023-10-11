import 'package:gestion_tesis/src/domain/entities/tesis.dart';

abstract class TesisDatasource{
  Future<List<Tesis>> getTesis({ int page = 1});
}


