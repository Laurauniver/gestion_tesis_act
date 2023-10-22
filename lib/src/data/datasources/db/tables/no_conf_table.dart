import 'package:drift/drift.dart';

@DataClassName('NoConformidadTableEntity')
class NoConformidadEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get descripcion => text()();

}