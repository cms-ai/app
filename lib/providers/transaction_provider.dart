import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/data/model/transaction_model.dart';
import 'package:app/data/respositories/repositories.dart';
import 'package:app/domain/usecases/exports.dart';
import 'package:riverpod/riverpod.dart';

///
/// delare transaction provider
///
final transactionProvider =
    Provider<TransactionRepositoryImpl>((ref) => TransactionRepositoryImpl());

///
/// Add transaction provider
///
final addTransactionProvider = Provider<AddTransaction>(
    (ref) => AddTransaction(ref.read(transactionProvider)));
final updateTransactionProvider = Provider<UpdateTransaction>(
    (ref) => UpdateTransaction(ref.read(transactionProvider)));
final delTransactionProvider = Provider<DelTransaction>(
    (ref) => DelTransaction(ref.read(transactionProvider)));

final getTransactionListProvider = Provider<GetTransactionList>(
    (ref) => GetTransactionList(ref.read(transactionProvider)));

/// get transaction list provider
final transactionListNotifierProvider =
    StateNotifierProvider<TransactionListNotifier, List<TransactionModel>>(
  (ref) => TransactionListNotifier(
    ref.read(addTransactionProvider),
    ref.read(updateTransactionProvider),
    ref.read(delTransactionProvider),
    ref.read(getTransactionListProvider),
  ),
);

class TransactionListNotifier extends StateNotifier<List<TransactionModel>> {
  final AddTransaction _addTransaction;
  final UpdateTransaction _updateTransaction;
  final DelTransaction _delTransaction;
  final GetTransactionList _getTransaction;
  TransactionListNotifier(
    this._addTransaction,
    this._updateTransaction,
    this._delTransaction,
    this._getTransaction,
  ) : super([]);

  Future<void> getTransactionList({required String userId}) async {
    final result = await _getTransaction.call(userId, false);
    switch (result) {
      case Success(value: List<TransactionModel>? data):
        state = [...data];
        break;
      default:
    }
  }

  Future<Result<String?, Exception>> addTransaction({
    required TransactionModel data,
  }) async {
    return _addTransaction.call(data);
  }

  Future<void> updateTransaction(TransactionModel data) async {
    if (data.transactionId == null) return;
    _updateTransaction.call(data.transactionId!, data);
  }

  Future<void> delTransaction(TransactionModel data) async {
    if (data.transactionId == null) return;
    _delTransaction.call(data.transactionId!);
  }
}
