import 'package:app/gen/export.dart';
import 'package:app/views/exports.dart';
import 'package:app/views/new_account_bank/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpSuccessScreen extends StatefulWidget {
  const SignUpSuccessScreen({super.key});

  @override
  State<SignUpSuccessScreen> createState() => _SignUpSuccessScreenState();
}

class _SignUpSuccessScreenState extends State<SignUpSuccessScreen> {
  @override
  void dispose() {
    super.dispose();
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
              child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  const Spacer(),
                  Assets.icons.icSignUpSuccess.svg(),
                  SizedBox(height: 10.h),
                  Text(
                    "You are set!",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: AppColors.textColor1,
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  CommonGradientButton(
                    customWidth: double.infinity,
                    contentButton: "Go to dashboard",
                    onTap: () {
                      context.goNamed(AppRouters.dashBoardRoute);
                    },
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
