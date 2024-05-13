import 'dart:ui';
import 'package:app/gen/assets.gen.dart';
import 'package:app/gen/fonts.gen.dart';
import 'package:app/providers/exports.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) async {
        final AppSharePreferences appSharePreferences = AppSharePreferences();
        if (status == AnimationStatus.completed) {
          final userId = await appSharePreferences.getUserId();
          final firstInitApp = await appSharePreferences.getFirstInitKey();

          // is Loggined
          if (userId != null && userId.isNotEmpty) {
            // Get current user data
            await ref
                .read(authListNotifierProvider.notifier)
                .getCurrentUser(ref, userId);
            Future.delayed(const Duration(seconds: 1), () {
              if (ref.read(userProvider.notifier).state?.isNewUser == true) {
                // if is new user, navigate to [setUpAccountIntroRoute]
                context.goNamed(AppRouters.setUpAccountIntroRoute);
              } else {
                // go to dashboard route
                context.goNamed(AppRouters.dashBoardRoute);
              }
            });
          } else {
            Future.delayed(const Duration(seconds: 1), () {
              if (firstInitApp == true) {
                appSharePreferences.setFirstInitKey(false);
                context.goNamed(AppRouters.introRoute);
              } else {
                context.goNamed(AppRouters.authRoute);
              }
            });
          }
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
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
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Assets.images.logoWithImage1.image(
                        height: animation.value,
                      );
                    }),
                const Spacer(),
                Text(
                  "Author: @tcaidev",
                  style: TextStyle(
                    fontFamily: FontFamily.poppins,
                    fontSize: 10.sp,
                    color: AppColors.textColor1.withOpacity(.2),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
