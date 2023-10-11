import 'package:gestion_tesis/src/domain/entities/tesis.dart';

abstract class TesisRepository{
  Future<List<Tesis>> getTesis({ int page = 1});
}