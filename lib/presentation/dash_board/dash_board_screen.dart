import 'dart:io';

import 'package:app/presentation/dash_board/providers/providers.dart';
import 'package:app/presentation/dash_board/views/exports.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreen extends ConsumerWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            top: -(size.height * 1.1),
            left: size.width * 0.4,
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
            bottom: 60.h + (Platform.isIOS ? 16.h : 0.h),
            child: SafeArea(
              bottom: false,
              child: IndexedStack(
                index: ref.watch(navBarProvider),
                children: [
                  const HomeScreen(),
                  const TransitionBodyScreen(),
                  Container(),
                  const BudgetScreen(),
                  const ProfileScreen(),
                ],
              ),
            ),
          ),
          const Positioned(bottom: 0, left: 0, right: 0, child: BottomNavBar())
        ],
      ),
    );
  }
}
