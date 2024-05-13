import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AccountBankRepository {
  Future<Result<List<TransactionModel>, Exception>> getAccountBank(
      String userId);
  Future<Result<dynamic, Exception>> addAccountBank(
      String userId, TransactionModel transactionModel);
  Future<void> updateAccountBank(
      String userId, TransactionModel transactionModel);
  Future<void> delAccountBank(String trasactionId);
}
