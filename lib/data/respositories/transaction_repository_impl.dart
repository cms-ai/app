import 'package:app/core/result.dart';
import 'package:app/data/model/transaction_model.dart';
import 'package:app/domain/repositories/repositories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final _transactionRef = FirebaseFirestore.instance.collection('transactions');
  final _uuid = const Uuid();

  @override
  Future<Result<String?, Exception>> addTransaction(
      TransactionModel data) async {
    try {
      await _transactionRef.doc(_uuid.v1()).set(data.toMap());
      return const Success("");
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<String?, Exception>> delTransaction(
      String transactionId) async {
    try {
      await _transactionRef.doc(transactionId).delete();
      return const Success("");
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<List<TransactionModel>, Exception>> getTransactionList(
      String userId) async {
    try {
      final result =
          await _transactionRef.where("userId", isEqualTo: userId).get();
      final transactionList = result.docs
          .map((element) => TransactionModel.fromMap(element.data()))
          .toList();
      return Success(transactionList);
    } on Exception catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<String?, Exception>> updateTransaction(
      String transactionId, TransactionModel newData) async {
    try {
      await _transactionRef.doc(transactionId).update(newData.toMap());
      return const Success("");
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
