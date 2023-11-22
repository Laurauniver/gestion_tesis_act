import 'package:gestion_tesis/src/data/models/tesis.dart';

abstract class TesisRepository {
  Future<List<TesisModel>> getAllTesis({String? titulo});

  Future<TesisModel> getTesisById(int id);
}
