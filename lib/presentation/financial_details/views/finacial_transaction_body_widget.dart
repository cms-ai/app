import 'package:app/data/model/models.dart';
import 'package:app/gen/export.dart';
import 'package:app/presentation/common_views/exports.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinacialTransactionBodyWidget extends StatelessWidget {
  const FinacialTransactionBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textColor2,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.icArrowDown.svg(color: AppColors.textColor1),
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
              return CommonTransactionItem(
                data: TransactionModel(),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
          ),
        ),
      ],
    );
  }
}
