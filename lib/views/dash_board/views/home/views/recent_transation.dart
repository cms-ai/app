import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:app/views/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransaction extends StatefulWidget {
  const RecentTransaction({super.key});

  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                  "Recent Transaction",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamily.poppins,
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontFamily.poppins,
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
            ],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return CommonTransactionItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
          ),
        ],
      ),
    );
  }
}
