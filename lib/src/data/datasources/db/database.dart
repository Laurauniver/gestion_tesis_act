import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/no_conf_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/prueba_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/report_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/tesis_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/tribunal_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/tutor_table.dart';
import 'package:gestion_tesis/src/data/datasources/db/tables/user_table.dart';
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
  tables: [TesisEntity, TribunalEntity, NoConformidadEntity, PruebaEntity, ReportEntity, TutorEntity, UserEntity],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
