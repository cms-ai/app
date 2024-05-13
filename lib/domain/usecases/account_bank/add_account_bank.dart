import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/account_bank_repository.dart';

class AddAccountBank {
  final AccountBankRepository repository;

  AddAccountBank(this.repository);

  Future<Result<dynamic, Exception>> call(
    String userId,
    AccountBankModel accountBankModel,
  ) {
    return repository.addAccountBank(userId, accountBankModel);
  }
}
