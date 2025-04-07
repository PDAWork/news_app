// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:news_app/db/app_database.dart';
import 'package:news_app/db/table/news.dart';

part 'news.g.dart';

@DriftAccessor(tables: [NewsTable])
class NewsDao extends DatabaseAccessor<AppDatabase> with _$NewsDaoMixin {
  NewsDao(super.db);

  Future<List<NewsTableData>> readAll({int? offset}) async => (select(newsTable)..limit(10, offset: offset)).get();

  Future<void> saveAll(Iterable<NewsTableData> dataList) async {
    await db.batch((batch) {
      final rows = dataList.map(
        (data) {
          final id = '${data.sourceId ?? data.sourceName}-${data.publishedAt.toUtc()}';
          return NewsTableCompanion.insert(
            id: id,
            sourceName: data.sourceName,
            author: data.author,
            title: data.title,
            description: data.description,
            content: data.content,
            url: data.url,
            urlToImage: data.urlToImage,
            publishedAt: data.publishedAt,
          );
        },
      );

      batch.insertAllOnConflictUpdate(
        newsTable,
        rows,
      );
    });
  }

  Future<void> save(NewsTableData data) {
    final id = '${data.sourceId ?? data.sourceName}-${data.publishedAt.toUtc()}';
    return into(newsTable).insertOnConflictUpdate(
      NewsTableCompanion.insert(
        id: id,
        sourceName: data.sourceName,
        author: data.author,
        title: data.title,
        description: data.description,
        content: data.content,
        url: data.url,
        urlToImage: data.urlToImage,
        publishedAt: data.publishedAt,
      ),
    );
  }

  Future<void> clear(NewsDao data) {
    return delete(newsTable).go();
  }
}
