import 'package:drift/drift.dart';

@DataClassName('TribunalTableEntity')
class TribunalEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get numero => integer()();

  TextColumn get presidente => text()();

  TextColumn get secretario => text()();

  TextColumn get vocal => text()();

  TextColumn get miembro => text()();
}
