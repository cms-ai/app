import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/data/respositories/budget_repository_impl.dart';
import 'package:app/domain/usecases/exports.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// delare transaction provider
///
final budgetProvider =
    Provider<BudgetRepositoryImpl>((ref) => BudgetRepositoryImpl());

// add budget provider
final addBudgetProvider =
    Provider<AddBudget>((ref) => AddBudget(ref.read(budgetProvider)));
final updateBudgetProvider =
    Provider<UpdateBudget>((ref) => UpdateBudget(ref.read(budgetProvider)));
final delBudgetProvider =
    Provider<DelBudget>((ref) => DelBudget(ref.read(budgetProvider)));
final getBudgetProvider =
    Provider<GetBudget>((ref) => GetBudget(ref.read(budgetProvider)));

final budgetListNotifierProvider =
    StateNotifierProvider<BudgetListNotifier, List<BudgetModel>>(
  (ref) => BudgetListNotifier(
    ref.read(addBudgetProvider),
    ref.read(updateBudgetProvider),
    ref.read(delBudgetProvider),
    ref.read(getBudgetProvider),
  ),
);

class BudgetListNotifier extends StateNotifier<List<BudgetModel>> {
  final AddBudget _addBudget;
  final UpdateBudget _updateBudget;
  final DelBudget _delBudget;
  final GetBudget _getBudget;

  BudgetListNotifier(
    this._addBudget,
    this._updateBudget,
    this._delBudget,
    this._getBudget,
  ) : super([]);

  Future<Result<String?, Exception>> handleAddBudget(BudgetModel data) {
    return _addBudget.call(data);
  }

  Future<Result<String?, Exception>> handleUpdateBudget(
      String budgetId, BudgetModel data) {
    return _updateBudget.call(budgetId, data);
  }

  Future<Result<String?, Exception>> handleDelBudget(String budgetId) {
    return _delBudget.call(budgetId);
  }

  Future<Result<List<BudgetModel>, Exception>> getBudgetList(
    String userId,
  ) {
    return _getBudget.call(userId);
  }
}
