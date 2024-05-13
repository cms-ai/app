import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/auth_repository.dart';

class AuthenticateUser {
  final AuthRepository repository;

  AuthenticateUser(this.repository);

  Future<Result<UserModel?, Exception>> call() {
    return repository.signInWithGoogle();
  }
}
