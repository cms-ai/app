import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/domain/repositories/account_bank_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class AccountBankRepositoryImpl extends AccountBankRepository {
  final accountBankRef = FirebaseFirestore.instance.collection('accountBanks');
  final _uuid = const Uuid();
  @override
  Future<Result<dynamic, Exception>> addAccountBank(
    String userId,
    AccountBankModel accountBankModel,
  ) async {
    try {
      await accountBankRef.doc(_uuid.v1()).set(accountBankModel.toMap());
      return const Success(null);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<void> delAccountBank(String userId) {
    // TODO: implement delAccountBank
    throw UnimplementedError();
  }

  @override
  Future<Result<List<TransactionModel>, Exception>> getAccountBank(
      String userId) async {
    try {
      final result =
          await accountBankRef.where("userId", isEqualTo: userId).get();
      final transactionList = result.docs
          .map((element) => TransactionModel.fromMap(element))
          .toList();
      return Success(transactionList);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<void> updateAccountBank(
    String userId,
    TransactionModel transactionModel,
  ) {
    // TODO: implement updateAccountBank
    throw UnimplementedError();
  }
}
