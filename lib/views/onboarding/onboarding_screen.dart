import 'dart:ui';
import 'package:app/gen/assets.gen.dart';
import 'package:app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Navigate intro route
          Future.delayed(const Duration(seconds: 1), () {
            context.goNamed(AppRouters.introRoute);
          });
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
