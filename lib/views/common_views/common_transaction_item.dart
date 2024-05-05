import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTransactionItem extends StatelessWidget {
  const CommonTransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6.h),
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF).withOpacity(.1),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xFFFCEED4),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Assets.icons.icExpense.svg(),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shopping",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamily.poppins,
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Buy some grocery",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textColor1,
                    fontFamily: FontFamily.poppins,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                r"- $120",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.primaryColor2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "10:00 AM",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textColor1,
                  fontFamily: FontFamily.poppins,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
