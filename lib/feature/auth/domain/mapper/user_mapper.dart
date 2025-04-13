// Project imports:
import 'package:news_app/db/app_database.dart';
import 'package:news_app/feature/auth/domain/entity/user_entity.dart';

extension UserDaoToUser on UserTableData {
  UserEntity get entity => UserEntity(
        name: name,
        email: email,
        password: password,
      );
}

extension UserToUserDao on UserEntity {
  UserTableData get dao => UserTableData(
        id: 0,
        name: name,
        email: email,
        password: password,
      );
}
