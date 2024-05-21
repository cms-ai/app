import 'package:app/core/result.dart';
import 'package:app/domain/repositories/repositories.dart';

class DelTransaction {
  final TransactionRepository repository;

  DelTransaction(this.repository);

  Future<Result<String?, Exception>> call(
    String transactionId,
  ) {
    return repository.delTransaction(transactionId);
  }
}
