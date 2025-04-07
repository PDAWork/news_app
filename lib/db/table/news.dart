// Package imports:
import 'package:drift/drift.dart';

class NewsTable extends Table {
  TextColumn get id => text()();

  TextColumn get sourceId => text().withLength(min: 3, max: 64).nullable()();

  TextColumn get sourceName => text().withLength(min: 3, max: 64)();

  TextColumn get author => text().withLength(min: 3, max: 64)();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get content => text()();

  TextColumn get url => text()();

  TextColumn get urlToImage => text()();

  DateTimeColumn get publishedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
