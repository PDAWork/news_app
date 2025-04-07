// Package imports:
import 'package:drift/drift.dart';

// Project imports:
import 'package:news_app/db/app_database.dart';
import 'package:news_app/db/table/user.dart';

part 'user.g.dart';

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<UserTableData?> get user => (select(userTable)..limit(1)).getSingleOrNull();

  Future<void> save(UserTableData data) {
    return into(userTable).insertOnConflictUpdate(
      UserTableCompanion.insert(
        name: data.name,
        email: data.email,
        password: data.password,
      ),
    );
  }

  Future<void> edit(UserTableData data) {
    return (update(userTable)..where((tbl) => tbl.id.equals(data.id))).write(
      UserTableCompanion(
        name: Value(data.name),
        email: Value(
          data.email,
        ),
      ),
    );
  }

  Future<void> editPassword(UserTableData data) {
    return (update(userTable)..where((tbl) => tbl.id.equals(data.id))).write(
      UserTableCompanion(
        password: Value(
          data.password,
        ),
      ),
    );
  }

  Future<void> editEmail(UserTableData data) {
    return (update(userTable)..where((tbl) => tbl.id.equals(data.id))).write(
      UserTableCompanion(
        email: Value(
          data.email,
        ),
      ),
    );
  }

  Future<void> clear(UserTableData data) {
    return delete(userTable).go();
  }
}
