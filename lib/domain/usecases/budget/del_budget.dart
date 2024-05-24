import 'package:app/core/result.dart';
import 'package:app/domain/repositories/repositories.dart';

class DelBudget {
  final BudgetRepository repository;

  const DelBudget(this.repository);

  Future<Result<String?, Exception>> call(
    String budgetId,
  ) {
    return repository.delBudget(budgetId);
  }
}
