import 'package:equatable/equatable.dart';

class AccountBankModel extends Equatable {
  final String? accountBankId;
  final String? name;
  final String? userId;
  final String? category;
  final int? moneyValue;
  final int? createdAt;
  final int? updateAt;

  const AccountBankModel({
    this.accountBankId,
    this.name,
    this.userId,
    this.category,
    this.moneyValue,
    this.createdAt,
    this.updateAt,
  });
  @override
  List<Object?> get props => [
        accountBankId,
        name,
        userId,
        category,
        moneyValue,
        createdAt,
        updateAt,
      ];

  factory AccountBankModel.fromMap(data) {
    return AccountBankModel(
      accountBankId: data["accountBankId"],
      name: data["name"],
      userId: data["userId"],
      category: data["category"],
      moneyValue: data["moneyValue"],
      createdAt: data["createdAt"],
      updateAt: data["updateAt"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      if (accountBankId != null) "accountBankId": accountBankId,
      if (name != null) "name": name,
      if (userId != null) "userId": userId,
      if (category != null) "category": category,
      if (moneyValue != null) "moneyValue": moneyValue,
      if (moneyValue != null) "moneyValue": moneyValue,
      if (createdAt != null) "createdAt": createdAt,
      if (updateAt != null) "updateAt": updateAt,
    };
  }
}
