import 'dart:io';

import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:app/views/common_views/common_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogOutBottomSheet extends StatefulWidget {
  const LogOutBottomSheet({super.key});

  @override
  State<LogOutBottomSheet> createState() => _LogOutBottomSheetState();
}

class _LogOutBottomSheetState extends State<LogOutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor5.withOpacity(.95),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Logout?",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              fontFamily: FontFamily.poppins,
              color: AppColors.textColor1,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Are you sure do you wanna logout?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.poppins,
              color: AppColors.textColor1.withOpacity(.4),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: CommonGradientButton(
                  customWidth: double.infinity,
                  contentButton: "Cancel",
                  customColor: AppColors.textColor2.withOpacity(.1),
                  onTap: () {
                    context.pop();
                  },
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: CommonGradientButton(
                  customWidth: double.infinity,
                  contentButton: "Logout",
                  onTap: () {
                    context.goNamed(AppRouters.authRoute);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 32.h : 16.h,
          )
        ],
      ),
    );
  }

  Widget _buildButton({
    required bool isSelected,
    String contentBtn = "",
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.textColor2.withOpacity(.2)
            : Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Text(
        contentBtn,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.poppins,
          color: isSelected
              ? AppColors.textColor2
              : AppColors.textColor1.withOpacity(.4),
        ),
      ),
    );
  }
}
