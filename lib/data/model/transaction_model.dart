import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String? transactionId;
  final String? transactionType;
  final String? description;
  final String? category;
  final String? accountBankId;
  final int? moneyValue;
  final int? createdAt;
  final int? updateAt;
  const TransactionModel({
    this.transactionId,
    this.transactionType,
    this.description,
    this.category,
    this.accountBankId,
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
        moneyValue,
        createdAt,
        updateAt,
      ];

  factory TransactionModel.fromMap(data) {
    return TransactionModel(
      transactionId: data["transactionId"],
      transactionType: data["transactionType"],
      description: data["description"],
      category: data["category"],
      accountBankId: data["accountBankId"],
      moneyValue: data["moneyValue"],
      createdAt: data["createdAt"],
      updateAt: data["updateAt"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
     if(transactionId != null) "transactionId": transactionId,
     if(transactionType != null) "transactionType": transactionType,
     if(description != null) "description": description,
     if(category != null) "category": category,
     if(accountBankId != null) "accountBankId": accountBankId,
     if(moneyValue != null) "moneyValue": moneyValue,
     if(createdAt != null) "createdAt": createdAt,
     if(updateAt != null) "updateAt": updateAt,
    };
  }
}
