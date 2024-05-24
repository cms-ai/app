import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/repositories.dart';

class UpdateBudget {
  final BudgetRepository repository;

  const UpdateBudget(this.repository);

  Future<Result<String?, Exception>> call(
    String budgetId,
    BudgetModel budgetModel,
  ) {
    return repository.updateBudget(budgetId, budgetModel);
  }
}
