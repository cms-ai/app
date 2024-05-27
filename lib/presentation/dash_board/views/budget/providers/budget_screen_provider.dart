part of '../budget_body_screen.dart';

final _monthIndexProvider = StateProvider<int>((ref) => DateTime.now().month);

final _currentBudgetList = StateProvider<List<BudgetModel>>((ref) => []);
