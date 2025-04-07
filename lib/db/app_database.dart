// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

// Project imports:
import 'package:news_app/core/logger/logger.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {},
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Получение директории, где будет храниться файл базы данных.
    final dbFolder = await getApplicationDocumentsDirectory();
    // Создание файла базы данных в полученной ранее директории.
    final file = File(join(dbFolder.path, 'news_app.sqlite'));
    logger.i('Db path\nopen ${file.path.replaceAll(basename(file.path), '')}');
    // Для обхода ограничения открытия базы данных SQLite на старых версиях Android
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Получение пути к временной директории.
    final cacheBase = (await getTemporaryDirectory()).path;

    // Установка пути к временной директории для SQLite.
    sqlite3.tempDirectory = cacheBase;

    // Создание базы данных в фоновом режиме и возвращение ее.
    return NativeDatabase.createInBackground(
      file,
      logStatements: !kReleaseMode,
    );
  });
}
