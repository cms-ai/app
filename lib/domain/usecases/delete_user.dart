import 'package:app/domain/repositories/auth_repository.dart';

class DeleteUser {
  final AuthRepository repository;
  DeleteUser(this.repository);

  Future<void> deleteUser(String userId) {
    return repository.deleteUser(userId);
  }
}
