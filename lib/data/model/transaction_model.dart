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
}
