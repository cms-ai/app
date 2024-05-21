import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String? transactionId;
  final String? transactionType;
  final String? description;
  final String? category;
  final String? accountBankId;
  final String? userId;
  final int? moneyValue;
  final int? createdAt;
  final int? updateAt;
  const TransactionModel({
    this.transactionId,
    this.transactionType,
    this.description,
    this.category,
    this.accountBankId,
    this.userId,
    this.moneyValue,
    this.createdAt,
    this.updateAt,
  });

  @override
  List<Object?> get props => [
        transactionId,
        transactionType,
        description,
        category,
        accountBankId,
        userId,
        moneyValue,
        createdAt,
        updateAt,
      ];

  factory TransactionModel.fromMap(Map<String, dynamic> data) {
    return TransactionModel(
      transactionId:
          data.containsKey("transactionId") ? data["transactionId"] : null,
      transactionType:
          data.containsKey("transactionType") ? data["transactionType"] : null,
      description: data.containsKey("description") ? data["description"] : null,
      category: data.containsKey("category") ? data["category"] : null,
      accountBankId:
          data.containsKey("accountBankId") ? data["accountBankId"] : null,
      userId: data.containsKey("userId") ? data["userId"] : null,
      moneyValue: data.containsKey("moneyValue") ? data["moneyValue"] : null,
      createdAt: data.containsKey("createdAt") ? data["createdAt"] : null,
      updateAt: data.containsKey("updateAt") ? data["updateAt"] : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (transactionId != null) "transactionId": transactionId,
      if (transactionType != null) "transactionType": transactionType,
      if (description != null) "description": description,
      if (category != null) "category": category,
      if (accountBankId != null) "accountBankId": accountBankId,
      if (userId != null) "userId": userId,
      if (moneyValue != null) "moneyValue": moneyValue,
      if (createdAt != null) "createdAt": createdAt,
      if (updateAt != null) "updateAt": updateAt,
    };
  }
}
