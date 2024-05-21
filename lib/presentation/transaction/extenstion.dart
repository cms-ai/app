import 'package:app/core/result.dart';
import 'package:app/data/model/transaction_model.dart';
import 'package:app/presentation/transaction/transaction_screen.dart';
import 'package:app/providers/exports.dart';
import 'package:app/utils/app_share_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

extension TransactionScreenExt on TransactionScreen {
  Future<void> handleAddTransaction(
    WidgetRef ref,
    BuildContext context, {
    required String category,
    required String transactionType,
    required String accountBankId,
    required int moneyValue,
    required String description,
  }) async {
    EasyLoading.show(status: "Creating...");
    // get user id from share preferences
    final userId = await AppSharePreferences().getUserId();
    // delacre input data and call function [addTransaction]
    // target: create data to firbase store
    final result =
        await ref.read(transactionListNotifierProvider.notifier).addTransaction(
              data: TransactionModel(
                category: category,
                userId: userId,
                accountBankId: accountBankId,
                moneyValue: moneyValue,
                description: description,
                createdAt: DateTime.now().millisecondsSinceEpoch,
                transactionType: transactionType,
              ),
            );
    switch (result) {
      case Success():
        EasyLoading.showSuccess("Created");
        // back to dashboard page
        Future.delayed(
          const Duration(milliseconds: 500),
          () => {context.pop()},
        );
        break;
      case Failure(exception: Exception error):
        // Show error dialog
        EasyLoading.showError(error.toString());
        break;
    }
    EasyLoading.dismiss();
  }
}
