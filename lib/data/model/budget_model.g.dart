// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      budgetId: json['budgetId'] as String?,
      budgetName: json['budgetName'] as String?,
      userId: json['userId'] as String?,
      startDate: (json['startDate'] as num?)?.toInt(),
      maxMoney: (json['maxMoney'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'budgetId': instance.budgetId,
      'budgetName': instance.budgetName,
      'userId': instance.userId,
      'startDate': instance.startDate,
      'maxMoney': instance.maxMoney,
    };
