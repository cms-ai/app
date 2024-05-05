import 'package:app/views/exports.dart';
import 'package:app/views/intro/views/exports.dart';
import 'dart:ui';

import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

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
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value.round();
                          });
                        },
                        children: [
                          IntroItemWidget(
                            image: Assets.images.intro.intro1
                                .image(fit: BoxFit.contain),
                            title: "Gain total control of your money",
                            description:
                                "Become your own money manager and make every cent count",
                          ),
                          IntroItemWidget(
                            image: Assets.images.intro.intro2
                                .image(fit: BoxFit.contain),
                            title: "Know where your money goes",
                            description:
                                "Track your transaction easily, with categories and financial report",
                          ),
                          IntroItemWidget(
                            image: Assets.images.intro.intro3
                                .image(fit: BoxFit.contain),
                            title: "Planning ahead",
                            description:
                                "Setup your budget for each category so you in control",
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          3,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            height: currentPage == index ? 16.h : 8.h,
                            width: currentPage == index ? 16.h : 8.h,
                            decoration: BoxDecoration(
                                color: currentPage == index
                                    ? AppColors.primaryColor3
                                    : AppColors.primaryColor4,
                                borderRadius: BorderRadius.circular(50.r)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CommonGradientButton(
                      customWidth: double.infinity,
                      contentButton: "Get started",
                      onTap: () {
                        // TODO: handle navigate to login screen
                        context.goNamed(AppRouters.authRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
