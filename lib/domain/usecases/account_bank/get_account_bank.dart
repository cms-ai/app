import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/account_bank_repository.dart';

class GetAccountBank {
  final AccountBankRepository repository;

  GetAccountBank(this.repository);

  Future<Result<List<TransactionModel>, Exception>> call(String userId) {
    return repository.getAccountBank(userId);
  }
}
