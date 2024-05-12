import 'dart:io';
import 'dart:ui';
import 'package:app/gen/export.dart';
import 'package:app/presentation/common_views/exports.dart';
import 'package:app/presentation/dash_board/views/home/views/exports.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FinancialDetailScreen extends StatelessWidget {
  const FinancialDetailScreen({super.key});

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
            bottom: (Platform.isIOS ? 16.h : 0.h),
            right: 10,
            left: 10,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  _buildAppBar(context),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.textColor2,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Assets.icons.icArrowDown
                                .svg(color: AppColors.textColor1),
                            const SizedBox(width: 10),
                            Text(
                              "October",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.poppins,
                                color: AppColors.textColor1,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColors.textColor2)),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.textColor2,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r),
                                  )),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.h),
                              child:
                                  Assets.icons.bottomNavBar.icTransaction.svg(
                                color: AppColors.textColor1,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                bottomLeft: Radius.circular(10.r),
                              )),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.h),
                              child: Assets.icons.bottomNavBar.icBudget.svg(
                                color: AppColors.textColor1,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            r"$ 6000",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.poppins,
                              color: AppColors.textColor1,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        CommonChart(),
                        SizedBox(height: 10.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          padding: EdgeInsets.all(4.h),
                          decoration: BoxDecoration(
                            color: AppColors.textColor1.withOpacity(.1),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.textColor2,
                                      borderRadius: BorderRadius.circular(50.r)),
                                  child: Text(
                                    "Expense",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primaryColor5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(50.r)),
                                  child: Text(
                                    "Income",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.textColor1.withOpacity(.3),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.textColor2,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.icons.icArrowDown
                                    .svg(color: AppColors.textColor1),
                                const SizedBox(width: 10),
                                Text(
                                  "Transaction",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.poppins,
                                    color: AppColors.textColor1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return CommonTransactionItem();
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 10.h);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
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
                "Financial Report",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18.sp,
                  fontFamily: FontFamily.syne,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
