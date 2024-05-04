import 'package:app/views/exports.dart';
import 'package:app/views/new_account_bank/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  static const String introRoute = "intro";
  static const String onboardingRoute = "onboarding";
  static const String authRoute = "auth";
  static const String setUpAccountIntroRoute = "setUpAccountIntroRoute";
  static const String newAccountBankRoute = "newAccountBankRoute";
  static const String signUpSuccessRoute = "signUpSuccessRoute";

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
      routes: const <RouteBase>[],
    ),
    GoRoute(
      name: AppRouters.newAccountBankRoute,
      path: AppRouters.getRoutePath(AppRouters.newAccountBankRoute),
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
    GoRoute(
      name: AppRouters.signUpSuccessRoute,
      path: AppRouters.getRoutePath(AppRouters.signUpSuccessRoute),
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpSuccessScreen();
      },
      routes: const <RouteBase>[],
    ),
  ]);
}
