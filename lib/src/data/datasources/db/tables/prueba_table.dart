import 'package:drift/drift.dart';

@DataClassName('PruebaTableEntity')
class PruebaEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get tipo => text()();

  TextColumn get descripcion => text()();

}