import 'package:drift/drift.dart';

@DataClassName('ReportTableEntity')
class ReportEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get tutores => text()();

}