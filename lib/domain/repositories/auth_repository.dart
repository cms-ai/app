import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';

abstract class AuthRepository {
  Future<void> getCurrentUser();

  Future<Result<UserModel?, Exception>> signInWithGoogle();

  Future<void> signInWithDemoAccount();

  Future<void> deleteUser(String userId);
}