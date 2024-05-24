// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      json['budgetId'] as String?,
      json['budgetName'] as String?,
      (json['dateFrom'] as num?)?.toInt(),
      (json['dateTo'] as num?)?.toInt(),
      (json['maxMoney'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'budgetId': instance.budgetId,
      'budgetName': instance.budgetName,
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'maxMoney': instance.maxMoney,
    };
