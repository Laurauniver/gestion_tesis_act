import 'package:drift/drift.dart';

@DataClassName('TesisTableEntity')
class TesisEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get tutorId => integer()();

  TextColumn get autor => text()();

  TextColumn get titulo => text()();

  IntColumn get ano => integer()();

  TextColumn get area => text()();
}
