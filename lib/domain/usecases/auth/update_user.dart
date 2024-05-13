import 'package:app/core/result.dart';
import 'package:app/data/model/user_model.dart';
import 'package:app/domain/repositories/auth_repository.dart';

class UpdateUser {
  AuthRepository repository;
  UpdateUser(this.repository);

  Future<Result<UserModel?, Exception>> call(String userId, UserModel? data) {
    return repository.updateUser(userId, data);
  }
}
