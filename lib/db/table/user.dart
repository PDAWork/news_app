// Package imports:
import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 3, max: 64).unique()();

  TextColumn get email => text().withLength(min: 3, max: 64).unique()();

  TextColumn get password => text()();
}
