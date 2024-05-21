import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/repositories.dart';

class UpdateTransaction {
  final TransactionRepository repository;

  UpdateTransaction(this.repository);

  Future<Result<String?, Exception>> call(
    String transactionId,
    TransactionModel transactionModel,
  ) {
    return repository.updateTransaction(transactionId, transactionModel);
  }
}
