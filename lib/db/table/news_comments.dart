// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:news_app/db/table/news.dart';
import 'package:news_app/db/table/user.dart';

class NewsCommentsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 3, max: 64).unique()();

  TextColumn get comment => text().withLength(max: 256)();

  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now().toUtc())();

  TextColumn get idNews => text().references(NewsTable, #id)();

  TextColumn get idUser => text().references(UserTable, #id)();
}
