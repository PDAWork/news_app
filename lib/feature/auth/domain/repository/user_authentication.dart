// Project imports:
import 'package:news_app/feature/auth/domain/entity/user_entity.dart';

abstract interface class UserAuthentication {
  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<UserEntity> signUp({
    required String name,
    required String email,
    required String password,
  });
}
