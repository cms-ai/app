import 'package:app/gen/export.dart';
import 'package:app/views/exports.dart';
import 'package:app/views/new_account_bank/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BudgetDetailsScreen extends StatefulWidget {
  const BudgetDetailsScreen({
    super.key,
  });

  @override
  State<BudgetDetailsScreen> createState() => _BudgetDetailsScreenState();
}

class _BudgetDetailsScreenState extends State<BudgetDetailsScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAppBar(context),
                SizedBox(height: 20.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textColor2,
                      ),
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 32.h,
                        height: 32.h,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.textColor2,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Assets.icons.icExpense.svg(),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Shopping",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.textColor1,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  r"Remaining",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.textColor1,
                    fontFamily: FontFamily.dMSans,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  r"$4000",
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: AppColors.textColor1,
                    fontFamily: FontFamily.dMSans,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 14.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Stack(
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF1F1FA).withOpacity(.2),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 20,
                        bottom: 0,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.textColor2,
                              borderRadius: BorderRadius.circular(10.r)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor2,
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.icons.icBugdetLimit
                          .svg(color: AppColors.textColor1),
                      SizedBox(width: 10.w),
                      Text(
                        r"You’ve exceed the limit!",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textColor1,
                          fontFamily: FontFamily.dMSans,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CommonGradientButton(
                    customWidth: double.infinity,
                    contentButton: "Update",
                    onTap: () {
                      context.pop();
                    },
                  ),
                ),
                SizedBox(height: 16.h)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textColor1,
              ),
            ),
            Expanded(
              child: Text(
                "Detail Budget",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18.sp,
                  fontFamily: FontFamily.syne,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.delete_outline_rounded,
              color: AppColors.textColor1,
            )
          ],
        ),
      ),
    );
  }
}
