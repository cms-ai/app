// auth repo provider
import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/data/respositories/repositories.dart';
import 'package:app/domain/usecases/exports.dart';
import 'package:app/utils/enums/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

// auth screen page state provider
final accountBankStateScreenProvider =
    StateProvider<AccountBankStateScreenEnum>(
  (ref) => AccountBankStateScreenEnum.initial,
);

final accountBankProvider = Provider<AccountBankRepositoryImpl>((ref) {
  return AccountBankRepositoryImpl();
});

// Get account list provider
final getAccountBankListProvider = Provider<GetAccountBankList>(
  (ref) {
    final repository = ref.read(accountBankProvider);
    return GetAccountBankList(repository);
  },
);

final addAccountBankProvider = Provider<AddAccountBank>(
  (ref) {
    final repository = ref.read(accountBankProvider);
    return AddAccountBank(repository);
  },
);

// auth list notifier provider
final accountBankListNotifierProvider =
    StateNotifierProvider<AccountBankListNotifier, List<AccountBankModel>>(
        (ref) {
  final getAccountBankList = ref.read(getAccountBankListProvider);
  final addAccountBank = ref.read(addAccountBankProvider);

  return AccountBankListNotifier(
    getAccountBankList,
    addAccountBank,
  );
});

class AccountBankListNotifier extends StateNotifier<List<AccountBankModel>> {
  final GetAccountBankList _getAccountBank;
  final AddAccountBank _addAccountBank;
  AccountBankListNotifier(
    this._getAccountBank,
    this._addAccountBank,
  ) : super([]);

  Future<void> getAccountBankList(WidgetRef ref, String userId) async {
    final result = await _getAccountBank.call(userId);
    switch (result) {
      case Success(value: List<AccountBankModel>? data):
        state = [...data];
        break;
      default:
    }
  }

  Future<void> addAccountBank(
    WidgetRef ref,
    String userId,
    String moneyValue,
    String name,
    String accountBankType,
  ) async {
    ref.read(accountBankStateScreenProvider.notifier).state =
        AccountBankStateScreenEnum.loading;

    final uuid = const Uuid().v1();
    final result = await _addAccountBank.call(
      userId,
      AccountBankModel(
        accountBankId: uuid,
        category: accountBankType,
        userId: userId,
        name: name,
        moneyValue: int.parse(moneyValue),
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
    switch (result) {
      case Success():
        ref.read(accountBankStateScreenProvider.notifier).state =
            AccountBankStateScreenEnum.success;
        break;
      case Failure():
        // server error
        ref.read(accountBankStateScreenProvider.notifier).state =
            AccountBankStateScreenEnum.failure;
        break;
    }
  }
}
