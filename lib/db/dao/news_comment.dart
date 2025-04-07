// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:news_app/db/app_database.dart';
import 'package:news_app/db/table/news_comments.dart';

part 'news_comment.g.dart';

@DriftAccessor(tables: [NewsCommentsTable])
class NewsCommentDao extends DatabaseAccessor<AppDatabase> with _$NewsCommentDaoMixin {
  NewsCommentDao(super.db);

  Future<List<NewsCommentsTableData>> getAllCommentsForNews(String idNews) {
    return (select(newsCommentsTable)..where((filter) => filter.idNews.equals(idNews))).get();
  }

  Future<void> save(NewsCommentsTableData data) {
    return into(newsCommentsTable).insertOnConflictUpdate(
      NewsCommentsTableCompanion.insert(
        name: data.name,
        comment: data.comment,
        idNews: data.idNews,
        idUser: data.idUser,
      ),
    );
  }
}
