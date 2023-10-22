import 'package:drift/drift.dart';

@DataClassName('TutorTableEntity')
class TutorEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nombre => text()();

  TextColumn get apellidos => text()();

}