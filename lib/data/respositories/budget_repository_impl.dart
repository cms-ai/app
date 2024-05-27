import 'package:app/core/result.dart';
import 'package:app/data/model/budget_model.dart';
import 'package:app/domain/repositories/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BudgetRepositoryImpl extends BudgetRepository {
  final _budgetRef = FirebaseFirestore.instance.collection('budgets');
  final _uuid = const Uuid();
  @override
  Future<Result<String?, Exception>> addBudget(BudgetModel data) async {
    try {
      // generate local random id
      data = data.copyWith(budgetId: _uuid.v1());
      await _budgetRef.doc(data.budgetId).set(data.toJson());
      return const Success("");
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<String?, Exception>> delBudget(String budgetId) async {
    try {
      await _budgetRef.doc(budgetId).delete();
      return const Success("");
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<List<BudgetModel>, Exception>> getBudgetList(
    String userId,
  ) async {
    try {
      final result = await _budgetRef.where("userId", isEqualTo: userId).get();
      final budgetResList = result.docs
          .map((element) => BudgetModel.fromJson(element.data()))
          .toList();

      return Success(budgetResList);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<String?, Exception>> updateBudget(
      String budgetId, BudgetModel data) async {
    try {
      await _budgetRef.doc(budgetId).update(data.toJson());
      return const Success("");
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
