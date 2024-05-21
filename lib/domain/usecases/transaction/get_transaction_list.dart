import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/repositories.dart';

class GetTransactionList {
  final TransactionRepository repository;

  GetTransactionList(this.repository);

  Future<Result<List<TransactionModel>, Exception>> call(
    String userId,
    bool isLoadMore,
  ) {
    return repository.getTransactionList(userId);
  }
}
