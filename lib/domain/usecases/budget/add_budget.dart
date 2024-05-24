import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/repositories.dart';

class AddBudget {
  final BudgetRepository repository;
  const AddBudget(this.repository);
  Future<Result<String?, Exception>> call(BudgetModel data) async {
    return repository.addBudget(data);
  }
}
