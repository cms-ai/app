part of '../budget_body_screen.dart';

extension BudgetScreenExt on BudgetBodyScreen {
  Future<void> handleChangeMoth(WidgetRef ref, int newIndex) async {
    final monthLength = AppDateTime.months.length;
    if (newIndex < 0 || newIndex > monthLength - 1) return;
    ref.read(_monthIndexProvider.notifier).state = newIndex;
    final userId = await AppSharePreferences().getUserId();

    //
    final DateTime nowTime = DateTime.now();
    final selectedTime =
        DateTime(nowTime.year, ref.read(_monthIndexProvider.notifier).state + 1)
            .millisecondsSinceEpoch;
    final result =
        await ref.read(budgetListNotifierProvider.notifier).getBudgetList(
              userId!,
            );

    switch (result) {
      case Success(value: List<BudgetModel> data):
        // print("Data; ${data}");
        final filterData =
            data.where((element) => element.startDate == selectedTime).toList();
        ref.read(_currentBudgetList.notifier).state = filterData;
        break;
      case Failure(exception: Exception error):
        // print("Error: =======: $error");
        break;
      default:
    }
  }

  Future<void> handleFetchData(
    WidgetRef ref,
  ) async {
    final userId = await AppSharePreferences().getUserId();
    final DateTime nowTime = DateTime.now();
    final selectedTime =
        DateTime(nowTime.year, ref.read(_monthIndexProvider.notifier).state + 1)
            .millisecondsSinceEpoch;
    final result = await ref
        .read(budgetListNotifierProvider.notifier)
        .getBudgetList(userId!);
    switch (result) {
      case Success(value: List<BudgetModel> data):
        ref.read(_currentBudgetList.notifier).state = data;
        final filterData =
            data.where((element) => element.startDate == selectedTime).toList();
        ref.read(_currentBudgetList.notifier).state = filterData;
        break;
      case Failure(exception: Exception error):
        print("Error: =======: $error");
        break;
      default:
    }
  }

  Future<int> handleGetSpendMoney(
    WidgetRef ref,
    BudgetModel budgetModel,
  ) async {
    try {
      int output = 0;

      final startDate =
          DateTime.fromMillisecondsSinceEpoch(budgetModel.startDate!);
      final endDate = DateTime(
        startDate.month + 1 > DateTime.december
            ? startDate.year + 1
            : startDate.year,
        startDate.month + 1 > DateTime.december ? 1 : startDate.month + 1,
      );
      final transactionList = ref.read(transactionListNotifierProvider);
      final newTransactionList = transactionList
          .where((element) =>
              element.dateTime! > startDate.millisecondsSinceEpoch &&
              element.dateTime! < endDate.millisecondsSinceEpoch &&
              element.transactionType == TransactionType.expense.name)
          .toList();
      for (var element in newTransactionList) {
        output += element.moneyValue ?? 0;
      }
      // final filter = transactionList..where((element) => element.);
      return output;
    } catch (e) {
      print("Error: $e");
      return 0;
    }
  }
}
