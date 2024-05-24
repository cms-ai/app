import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';

abstract class BudgetRepository {
  Future<Result<String?, Exception>> addBudget(BudgetModel data);
  Future<Result<List<BudgetModel>, Exception>> getBudgetList(String userId);
  Future<Result<String?, Exception>> updateBudget(
      String budgetId, BudgetModel data);
  Future<Result<String?, Exception>> delBudget(String budgetId);
}
