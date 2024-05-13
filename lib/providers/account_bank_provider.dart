// auth repo provider
import 'package:app/data/model/models.dart';
import 'package:app/data/respositories/repositories.dart';
import 'package:app/domain/usecases/exports.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountBankProvider = Provider<AccountBankRepositoryImpl>((ref) {
  return AccountBankRepositoryImpl();
});

final getAccountBankProvider = Provider<GetAccountBank>(
  (ref) {
    final repository = ref.read(accountBankProvider);
    return GetAccountBank(repository);
  },
);

// auth list notifier provider
final accountBankListNotifierProvider =
    StateNotifierProvider<AccountBankListNotifier, List<TransactionModel>>(
        (ref) {
  final getAccountBank = ref.read(getAccountBankProvider);

  return AccountBankListNotifier(
    getAccountBank,
  );
});

class AccountBankListNotifier extends StateNotifier<List<TransactionModel>> {
  final GetAccountBank _getAccountBank;
  AccountBankListNotifier(this._getAccountBank) : super([]);

  Future<void> getAccountBank(String userId) async {
    await _getAccountBank.call(userId);
  }
}
