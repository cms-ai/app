import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/repositories.dart';

class GetBudget {
  final BudgetRepository repository;
  const GetBudget(this.repository);
  Future<Result<List<BudgetModel>, Exception>> call(String userId) {
    return repository.getBudgetList(userId);
  }
}