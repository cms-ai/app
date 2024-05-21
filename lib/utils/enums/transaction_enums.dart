import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

enum TransactionType {
  expense,
  income; // method

  static List<String> toStringList() {
    return TransactionType.values.map((e) => e.toTitle()).toList();
  }
}

extension TransactionTypeExt on TransactionType {
  String toTitle() {
    switch (this) {
      case TransactionType.expense:
        return "Expense";
      case TransactionType.income:
        return "Income";
    }
  }

  Color getColor() {
    switch (this) {
      case TransactionType.expense:
        return AppColors.primaryColor2;
      case TransactionType.income:
        return Colors.green;
    }
  }

  String getStringMoney(int number) {
    switch (this) {
      case TransactionType.expense:
        return "- \$$number";
      case TransactionType.income:
        return "+ \$$number";
    }
  }
}

enum TransactionCategoryEnum {
  shopping(TransactionType.expense),
  subscription(TransactionType.expense),
  food(TransactionType.expense),
  salary(TransactionType.income),
  passiveIncome(TransactionType.income);

  const TransactionCategoryEnum(this.transactionType);
  final TransactionType transactionType;

  // method
  static List<String> toStringList() {
    return TransactionCategoryEnum.values.map((e) => e.toTitle()).toList();
  }
}

extension TransactionCategoryEnumExt on TransactionCategoryEnum {
  String toTitle() {
    switch (this) {
      case TransactionCategoryEnum.shopping:
        return "Shopping";
      case TransactionCategoryEnum.subscription:
        return "Subscription";
      case TransactionCategoryEnum.food:
        return "Food";
      case TransactionCategoryEnum.salary:
        return "Salary";
      case TransactionCategoryEnum.passiveIncome:
        return "Passive Income";
    }
  }

  Color getBgColor() {
    switch (this) {
      case TransactionCategoryEnum.shopping:
        return AppColors.yellow20Color;
      case TransactionCategoryEnum.subscription:
        return AppColors.violet20Color;
      case TransactionCategoryEnum.food:
        return AppColors.red20Color;
      case TransactionCategoryEnum.salary:
        return AppColors.green20Color;
      case TransactionCategoryEnum.passiveIncome:
        return AppColors.black20Color;
    }
  }

  SvgGenImage getIcon() {
    switch (this) {
      case TransactionCategoryEnum.shopping:
        return Assets.icons.icShoppingBag;
      case TransactionCategoryEnum.subscription:
        return Assets.icons.icRecurringBill;
      case TransactionCategoryEnum.food:
        return Assets.icons.icRestaurant;
      case TransactionCategoryEnum.salary:
        return Assets.icons.icSalary;
      case TransactionCategoryEnum.passiveIncome:
        return Assets.icons.icIncome;
    }
  }
}
