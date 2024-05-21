import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/repositories.dart';

class AddTransaction {
  final TransactionRepository repository;

  AddTransaction(this.repository);

  Future<Result<String?, Exception>> call(
    TransactionModel transactionModel,
  ) {
    return repository.addTransaction(transactionModel);
  }
}
