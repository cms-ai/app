import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

@freezed
class BudgetModel with _$BudgetModel {

  factory BudgetModel(
    String? budgetId,
    String? budgetName,
    int? dateFrom,
    int? dateTo,
    int? maxMoney,
  ) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) => _$BudgetModelFromJson(json);
}