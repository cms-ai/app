import 'dart:io';

import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:app/views/common_views/common_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FilterBodyWidget extends StatefulWidget {
  const FilterBodyWidget({super.key});

  @override
  State<FilterBodyWidget> createState() => _FilterBodyWidgetState();
}

class _FilterBodyWidgetState extends State<FilterBodyWidget> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Filter Transaction",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.textColor1,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.textColor2.withOpacity(.2),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.poppins,
                    color: AppColors.textColor2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "Filter by",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.poppins,
              color: AppColors.textColor1,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              _buildButton(isSelected: true, contentBtn: "Income"),
              SizedBox(width: 10),
              _buildButton(isSelected: false, contentBtn: "Expense"),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "Sort By",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.poppins,
              color: AppColors.textColor1,
            ),
          ),
          SizedBox(height: 10.h),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildButton(isSelected: true, contentBtn: "Highest"),
              _buildButton(isSelected: false, contentBtn: "Lowest"),
              _buildButton(isSelected: false, contentBtn: "Newest"),
              _buildButton(isSelected: false, contentBtn: "Oldest"),
            ],
          ),
          SizedBox(height: 40.h),
          CommonGradientButton(
            customWidth: double.infinity,
            contentButton: "Apply",
            onTap: () {
              context.pop();
            },
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
