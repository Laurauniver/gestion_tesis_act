import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gestion_tesis/src/data/datasources/db/tables/no_conf_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/prueba_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/report_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/tesis_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/tribunal_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/tutor_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    TesisEntity,
    TribunalEntity,
    NoConformidadEntity,
    PruebaEntity,
    ReportEntity,
    TutorEntity,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _populateDatabase(m);
        },
      );

  Future<void> _insertTesisBatch(Batch batch, List<dynamic> tesisData) async {
    for (final data in tesisData) {
      batch.insert(
        tesisEntity,
        TesisEntityCompanion.insert(
          tutorId: (_getIntValue(data['tutorId'])!),
          autor: (_getStringValue(data['autor'])),
          titulo: (_getStringValue(data['titulo'])),
          ano: (_getIntValue(data['ano'])!),
          area: (_getStringValue(data['area'])),
          texto: (_getStringValue(data['texto'])),
        ),
      );
    }
  }

  Future<void> _insertNoConformidadBatch(
      Batch batch, List<dynamic> noConformidadData) async {
    for (final data in noConformidadData) {
      batch.insert(
        noConformidadEntity,
        NoConformidadEntityCompanion.insert(
          descripcion: (_getStringValue(data['descripcion'])),
        ),
      );
    }
  }

  Future<void> _insertPruebaBatch(Batch batch, List<dynamic> pruebaData) async {
    for (final data in pruebaData) {
      batch.insert(
        pruebaEntity,
        PruebaEntityCompanion.insert(
          tipo: (_getStringValue(data['tipo'])),
          descripcion: (_getStringValue(data['descripcion'])),
          texto: (_getStringValue(data['resumen'])),
        ),
      );
    }
  }

  Future<void> _insertReportBatch(Batch batch, List<dynamic> reportData) async {
    for (final data in reportData) {
      batch.insert(
        reportEntity,
        ReportEntityCompanion.insert(
          tutores: (_getStringValue(data['tutores'])),
        ),
      );
    }
  }

  Future<void> _insertTribunalBatch(
      Batch batch, List<dynamic> tribunalData) async {
    for (final data in tribunalData) {
      batch.insert(
        tribunalEntity,
        TribunalEntityCompanion.insert(
          numero: (_getIntValue(data['numero'])!),
          presidente: (_getStringValue(data['presidente'])),
          secretario: (_getStringValue(data['secretario'])),
          vocal: (_getStringValue(data['vocal'])),
          miembro: (_getStringValue(data['miembro'])),
        ),
      );
    }
  }

  Future<void> _insertTutorBatch(Batch batch, List<dynamic> tutorData) async {
    for (final data in tutorData) {
      batch.insert(
        tutorEntity,
        TutorEntityCompanion.insert(
          nombre: (_getStringValue(data['nombre'])),
          apellidos: (_getStringValue(data['apellidos'])),
        ),
      );
    }
  }

  int? _getIntValue(dynamic value) => value as int?;
  String _getStringValue(dynamic value) => value as String;

  Future<void> _populateDatabase(Migrator m) async {
    final jsonData = await rootBundle.loadString('assets/json/data.json');
    final data = json.decode(jsonData);

    await m.database.batch((batch) async {
      await _insertTesisBatch(batch, data['tesis']);
      await _insertNoConformidadBatch(batch, data['noConformidades']);
      await _insertPruebaBatch(batch, data['pruebas']);
      await _insertReportBatch(batch, data['reportes']);
      await _insertTribunalBatch(batch, data['tribunales']);
      await _insertTutorBatch(batch, data['tutores']);
      log('insertado correctamente');
    });
  }
}
