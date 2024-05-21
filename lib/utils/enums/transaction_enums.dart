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
}
