import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';

abstract class TransactionRepository {
  Future<Result<String?, Exception>> addTransaction(TransactionModel data);
  Future<Result<List<TransactionModel>, Exception>> getTransactionList(
      String userId);
  Future<Result<String?, Exception>> updateTransaction(
      String transactionId, TransactionModel newData);
  Future<Result<String?, Exception>> delTransaction(String transactionId);
}
