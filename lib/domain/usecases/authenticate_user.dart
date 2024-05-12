import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/auth_repository.dart';

class AuthenticateUser {
  final AuthRepository repository;

  AuthenticateUser(this.repository);

  Future<void> call(UserModel userModel) {
    return repository.signInWithGoogle();
  }
}
