import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/presentation/exports.dart';
import 'package:app/providers/budget_provider.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension BudgetScreenExtension on BudgetScreen {
  Future<void> handleAddBudget(
    WidgetRef ref,
    BuildContext context, {
    required String budgetName,
    required int dateFrom,
    required int dateTo,
    required int maxMoney,
    //
  }) async {
    EasyLoading.show(status: "Creating...");
    // get user id from share preferences
    final userId = await AppSharePreferences().getUserId();
    // delacre input data and call function [handleAddBudget]
    // target: create data to firbase store
    final result =
        await ref.read(budgetListNotifierProvider.notifier).handleAddBudget(
              BudgetModel(
                budgetName: budgetName,
                dateFrom: dateFrom,
                dateTo: dateTo,
                userId: userId,
                maxMoney: maxMoney,
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
