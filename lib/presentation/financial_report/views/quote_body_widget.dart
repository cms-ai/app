import 'package:app/gen/export.dart';
import 'package:app/presentation/common_views/exports.dart';

import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class QuoteBodyWidget extends StatelessWidget {
  const QuoteBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            "\"Financial freedom is freedom from fear.\"",
            style: TextStyle(
              fontSize: 24.sp,
              color: AppColors.textColor1,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "-Robert Kiyosaki",
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.textColor1,
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),
          const Spacer(
            flex: 2,
          ),
          CommonGradientButton(
            customWidth: double.infinity,
            contentButton: "See the full detail",
            onTap: () {
              context.goNamed(AppRouters.financialReportDetailRoute);
            },
          ),
          SizedBox(height: 16.h)
        ],
      ),
    );
  }
}
