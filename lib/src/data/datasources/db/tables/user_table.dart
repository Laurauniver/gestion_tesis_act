import 'package:drift/drift.dart';

@DataClassName('UserTableEntity')
class UserEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get username => text()();

  TextColumn get password => text()();

  TextColumn get email => text()();

}