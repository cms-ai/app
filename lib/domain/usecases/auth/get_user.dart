import 'package:app/core/result.dart';
import 'package:app/data/model/user_model.dart';
import 'package:app/domain/repositories/auth_repository.dart';

class GetUser {
  AuthRepository repository;
  GetUser(this.repository);

  Future<Result<UserModel?, Exception>> call(String userId) {
    return repository.getUser();
  }
}
