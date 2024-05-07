import 'package:app/gen/export.dart';
import 'package:app/gen/fonts.gen.dart';
import 'package:app/utils/utils.dart';
import 'package:app/views/common_views/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text(
            "May",
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.textColor1,
              fontFamily: FontFamily.dMSans,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF).withOpacity(.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildBudgetItem(
                          currentValue: 1000,
                          maxValue: 1200,
                          onTap: () {
                            context.goNamed(AppRouters.budgetDetailsRoute);
                          }
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                      itemCount: 10),
                ),
                SizedBox(height: 20.h),
                CommonGradientButton(
                  customWidth: double.infinity,
                  contentButton: "Create a budget",
                  onTap: () {
                    // TODO: Navigate to budget item details
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetItem({
    required int currentValue,
    required maxValue,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.textColor2,
            ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: AppColors.textColor2.withOpacity(.3),
                      border: Border.all(
                        color: AppColors.textColor2.withOpacity(.5),
                      ),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 14.h,
                                  width: 14.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFCAC12),
                                    shape: BoxShape.circle,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 4.h),
                          Text(
                            "Shopping",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textColor1,
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Assets.icons.icBugdetLimit.svg()
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              r"Remaining $0",
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.textColor1,
                fontFamily: FontFamily.dMSans,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Stack(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFF1F1FA).withOpacity(.2),
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
            SizedBox(height: 4.h),
            Text(
              r"$1200 of $1000",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textColor1.withOpacity(.5),
                fontFamily: FontFamily.dMSans,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              r"You’ve exceed the limit!",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryColor2,
                fontFamily: FontFamily.dMSans,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
