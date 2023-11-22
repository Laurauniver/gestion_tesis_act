import 'package:gestion_tesis/src/data/datasources/db/database.dart';
import 'package:gestion_tesis/src/data/mapper/tutor_mapper.dart';
import 'package:gestion_tesis/src/data/mapper/tutor_tesis_mapper.dart';
import 'package:gestion_tesis/src/data/models/tesis.dart';
import 'package:gestion_tesis/src/domain/entities/tutor_tesis_entity.dart';

class ReportDataSources {
  ReportDataSources(this._appDatabase);

  final AppDatabase _appDatabase;

  $TutorEntityTable get tutorEntity => _appDatabase.tutorEntity;
  $TesisEntityTable get tesisEntity => _appDatabase.tesisEntity;

  Future<List<TutorTesisEntity>> getAllTutorWithTesis() async {
    List<TutorTesisEntity> tutorsWithTesis = [];
    List<TesisModel> tesisList = [];

    final tutors = await _appDatabase.select(tutorEntity).get();

    // for (var tutor in tutors) {
    //   final tesis = await (_appDatabase.select(tesisEntity)
    //         ..where((tbl) => tbl.tutorId.equals(tutor.id)))
    //       .get();
    //   if (tesis.isNotEmpty) {
    //     final tutorModel = TutorMapper.entityToModel(tutor);
    //     for (var tesisEntity in tesis) {
    //       final tesisModel = TesisMapper.entityToModel(tesisEntity);
    //       tesisList.add(tesisModel);
    //     }
    //     final tutorWithTesis =
    //         TutorTesisMapper.tableToEntity(tutorModel, tesisList);
    //     tutorsWithTesis.add(tutorWithTesis);
    //   }
    // }
    return tutorsWithTesis;
  }
}
