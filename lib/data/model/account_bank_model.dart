import 'package:equatable/equatable.dart';

class AccountBankModel extends Equatable {
  final String? accountBankId;
  final String? name;
  final String? userId;
  final String? category;
  final int? moneyValue;
  final int? createdAt;
  final int? updatedAt;

  const AccountBankModel({
    this.accountBankId,
    this.name,
    this.userId,
    this.category,
    this.moneyValue,
    this.createdAt,
    this.updatedAt,
  });
  @override
  List<Object?> get props => [
        accountBankId,
        name,
        userId,
        category,
        moneyValue,
        createdAt,
        updatedAt,
      ];

  factory AccountBankModel.fromMap(Map<String, dynamic> data) {
    return AccountBankModel(
      accountBankId:
          data.containsKey("accountBankId") ? data["accountBankId"] : null,
      name: data.containsKey("name") ? data["name"] : null,
      userId: data.containsKey("userId") ? data["userId"] : null,
      category: data.containsKey("category") ? data["category"] : null,
      moneyValue: data.containsKey("moneyValue") ? data["moneyValue"] : null,
      createdAt: data.containsKey("createdAt") ? data["createdAt"] : null,
      updatedAt: data.containsKey("updatedAt") ? data["updatedAt"] : null,
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
      if (updatedAt != null) "updatedAt": updatedAt,
    };
  }

  List<String> getAccountBankTitleList(List<AccountBankModel> data) {
    return data.map((e) => e.name ?? "").toList();
  }
}
