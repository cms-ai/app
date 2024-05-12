import 'package:app/gen/export.dart';

import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetBodyWidget extends StatelessWidget {
  const BudgetBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Text(
            "This Month",
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.textColor1.withOpacity(.3),
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            "2 of 12 Budget is exceeds the limit",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.sp,
              color: AppColors.textColor1,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.h),
    
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.textColor2,
                    ),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 32.h,
                      height: 32.h,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.textColor2.withOpacity(.4),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child:
                          Assets.icons.icExpense.svg(color: AppColors.textColor2),
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
              
            ],
          ),
          const Spacer(),
          // CommonGradientButton(
          //   customWidth: double.infinity,
          //   contentButton: "Let's go",
          //   onTap: () {
          //     context.goNamed(AppRouters.newAccountBankRoute,
          //         queryParameters: {
          //           "action": NewAccountActionEnum.add.name
          //         });
          //   },
          // ),
        ],
      ),
    );
  }
}
