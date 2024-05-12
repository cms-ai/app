import 'package:app/presentation/auth/views/exports.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/utils/enums/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateScreenProvider, (previous, next) {
      if (previous != next) {
        switch (next) {
          case AuthStateScreenEnum.loading:
            EasyLoading.show(status: 'loading...');
            break;
          case AuthStateScreenEnum.success:
            EasyLoading.showSuccess("Đăng nhập thành công");
            ref.read(authStateScreenProvider.notifier).state =
                AuthStateScreenEnum.initial;

            // print("=== ${ref.read(userProvider.notifier).state?.isNewUser}");
            if (ref.read(userProvider.notifier).state?.isNewUser == true) {
              context.goNamed(AppRouters.setUpAccountIntroRoute);
            } else {
              context.goNamed(AppRouters.dashBoardRoute);
            }
            break;
          case AuthStateScreenEnum.failure:
            EasyLoading.showError("Đăng nhập thất bại. Xin vui lòng thử lại");
            ref.read(authStateScreenProvider.notifier).state =
                AuthStateScreenEnum.initial;
          default:
        }
      }
    });
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColors.bgColor1,
            ),
          ),
          Positioned(
            top: size.height * 0.9,
            left: size.width * 0.3,
            child: Container(
              width: 359.w,
              height: 849.h,
              decoration: BoxDecoration(
                color: AppColors.subColor1.withOpacity(.5),
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(200, 500),
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
          LoginView(
            onTap: () async {
              await ref
                  .read(authListNotifierProvider.notifier)
                  .signInWithGoogle(ref);
            },
          ),
        ],
      ),
    );
  }
}
