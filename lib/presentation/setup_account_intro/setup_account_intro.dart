import 'package:app/gen/fonts.gen.dart';
import 'package:app/presentation/exports.dart';
import 'package:app/presentation/new_account_bank/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SetupAccountIntro extends StatefulWidget {
  const SetupAccountIntro({super.key});

  @override
  State<SetupAccountIntro> createState() => _SetupAccountIntroState();
}

class _SetupAccountIntroState extends State<SetupAccountIntro> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    "Let’s setup your\naccount!",
                    style: TextStyle(
                      fontSize: 36.sp,
                      color: AppColors.textColor1,
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Account can be your bank, credit card or\nyour wallet.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textColor1,
                      fontFamily: FontFamily.poppins,
                    ),
                  ),
                  const Spacer(),
                  CommonGradientButton(
                    customWidth: double.infinity,
                    contentButton: "Let's go",
                    onTap: () {
                      context.goNamed(AppRouters.newAccountBankRoute, queryParameters: {"action": NewAccountActionEnum.add.name});
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
