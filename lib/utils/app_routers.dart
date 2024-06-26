import 'package:app/presentation/exports.dart';
import 'package:app/presentation/new_account_bank/enums.dart';
import 'package:app/presentation/transaction/enums.dart';
import 'package:app/presentation/transaction_details/transaction_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  static const String introRoute = "intro";
  static const String onboardingRoute = "onboarding";
  static const String authRoute = "auth";
  static const String setUpAccountIntroRoute = "setUpAccountIntroRoute";
  static const String newAccountBankRoute = "newAccountBankRoute";
  static const String newAccountBankProfileRoute = "newAccountBankProfileRoute";
  static const String signUpSuccessRoute = "signUpSuccessRoute";
  static const String dashBoardRoute = "dashBoardRoute";
  static const String transactionRoute = "transactionRoute";
  static const String editTransactionRoute = "editTransactionRoute";
  static const String accountRoute = "accountRoute";
  static const String accountDetailsRoute = "accountDetailsRoute";
  static const String budgetDetailsRoute = "budgetDetailsRoute";
  static const String budgetRoute = "budgetRoute";
  static const String transactionDetailRoute = "transactionDetailRoute";
  static const String financialReportRoute = "financialReportRoute";
  static const String financialReportDetailRoute = "financialReportDetailRoute";

  static String getRoutePath(String value) {
    return "/$value";
  }
}

class Routers {
  static final GoRouter routers = GoRouter(routes: [
    GoRoute(
      name: AppRouters.introRoute,
      path: AppRouters.getRoutePath(AppRouters.introRoute),
      builder: (BuildContext context, GoRouterState state) {
        return const IntroScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      name: AppRouters.onboardingRoute,
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      name: AppRouters.authRoute,
      path: AppRouters.getRoutePath(AppRouters.authRoute),
      builder: (BuildContext context, GoRouterState state) {
        return const AuthScreen();
      },
      routes: const <RouteBase>[
        // GoRoute(
        //   path: 'details',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const DetailsScreen();
        //   },
        // ),
      ],
    ),
    GoRoute(
      name: AppRouters.setUpAccountIntroRoute,
      path: AppRouters.getRoutePath(AppRouters.setUpAccountIntroRoute),
      builder: (BuildContext context, GoRouterState state) {
        return const SetupAccountIntro();
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppRouters.newAccountBankRoute,
          path: AppRouters.newAccountBankRoute,
          builder: (BuildContext context, GoRouterState state) {
            return NewAccountBanksScreen(
              action: NewAccountActionEnum.values
                  .where(
                    (element) =>
                        element.name == state.uri.queryParameters["action"]!,
                  )
                  .first,
            );
          },
          routes: const <RouteBase>[],
        ),
      ],
    ),
    GoRoute(
      name: AppRouters.signUpSuccessRoute,
      path: AppRouters.getRoutePath(AppRouters.signUpSuccessRoute),
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpSuccessScreen();
      },
      routes: const <RouteBase>[],
    ),
    GoRoute(
      name: AppRouters.dashBoardRoute,
      path: AppRouters.getRoutePath(AppRouters.dashBoardRoute),
      builder: (BuildContext context, GoRouterState state) {
        return const DashBoardScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppRouters.transactionDetailRoute,
          path: AppRouters.transactionDetailRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const TransactionDetailsScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              name: AppRouters.editTransactionRoute,
              path: AppRouters.editTransactionRoute,
              builder: (BuildContext context, GoRouterState state) {
                return TransactionScreen(
                  actionType: TransactionActionEnum.values
                      .where(
                        (element) =>
                            element.name ==
                            state.uri.queryParameters["action"]!,
                      )
                      .first,
                );
              },
              routes: const [],
            ),
          ],
        ),
        GoRoute(
          name: AppRouters.financialReportRoute,
          path: AppRouters.financialReportRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const FinancialReportScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              name: AppRouters.financialReportDetailRoute,
              path: AppRouters.financialReportDetailRoute,
              builder: (BuildContext context, GoRouterState state) {
                return const FinancialDetailScreen();
              },
              routes: const <RouteBase>[],
            ),
          ],
        ),
        GoRoute(
          name: AppRouters.budgetRoute,
          path: AppRouters.budgetRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const BudgetScreen();
          },
          routes: const <RouteBase>[],
        ),
        GoRoute(
          name: AppRouters.transactionRoute,
          path: AppRouters.transactionRoute,
          builder: (BuildContext context, GoRouterState state) {
            final String value = state.uri.queryParameters["action"] ??
                TransactionActionEnum.add.name;
            return TransactionScreen(
              actionType: TransactionActionEnum.values
                  .where(
                    (element) => element.name == value,
                  )
                  .first,
            );
          },
          routes: const [],
        ),
        GoRoute(
          name: AppRouters.budgetDetailsRoute,
          path: AppRouters.budgetDetailsRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const BudgetDetailsScreen();
          },
          routes: const <RouteBase>[],
        ),
        GoRoute(
          name: AppRouters.accountRoute,
          path: AppRouters.accountRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const AccountScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              name: AppRouters.accountDetailsRoute,
              path: AppRouters.accountDetailsRoute,
              builder: (BuildContext context, GoRouterState state) {
                return AccountDetailsScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  name: AppRouters.newAccountBankProfileRoute,
                  path: AppRouters.newAccountBankProfileRoute,
                  builder: (BuildContext context, GoRouterState state) {
                    return NewAccountBanksScreen(
                      action: NewAccountActionEnum.values
                          .where(
                            (element) =>
                                element.name ==
                                state.uri.queryParameters["action"]!,
                          )
                          .first,
                    );
                  },
                  routes: const <RouteBase>[],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ]);
}
