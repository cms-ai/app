import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/account_bank_repository.dart';

class GetAccountBankList {
  final AccountBankRepository repository;

  GetAccountBankList(this.repository);

  Future<Result<List<TransactionModel>, Exception>> call(String userId) {
    return repository.getAccountBank(userId);
  }
}
