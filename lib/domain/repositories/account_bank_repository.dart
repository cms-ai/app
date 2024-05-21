import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';

abstract class AccountBankRepository {
  Future<Result<List<AccountBankModel>, Exception>> getAccountBank(
      String userId);
  Future<Result<dynamic, Exception>> addAccountBank(
      String userId, AccountBankModel accountBankModel);
  Future<void> updateAccountBank(
      String userId, TransactionModel transactionModel);
  Future<void> delAccountBank(String trasactionId);
}
