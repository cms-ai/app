import 'package:app/data/model/models.dart';
import 'package:app/gen/export.dart';
import 'package:app/utils/enums/enums.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CommonTransactionItem extends StatelessWidget {
  final TransactionModel data;
  const CommonTransactionItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final TransactionType transactionType = data.getTransactionType();
    final TransactionCategoryEnum transCategoryEnum =
        data.getTransCategoryType();
    return GestureDetector(
      onTap: () {
        context.goNamed(AppRouters.transactionDetailRoute);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6.h),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF).withOpacity(.1),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: transCategoryEnum.getBgColor(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: transCategoryEnum.getIcon().svg(),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.category ?? "",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: FontFamily.poppins,
                      color: AppColors.textColor2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    data.description ?? "",
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
                  transactionType.getStringMoney(data.moneyValue ?? 0),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamily.poppins,
                    color: transactionType.getColor(),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6.h),
                if (data.createdAt != null)
                  Text(
                    AppDateTime.convertToDateTimeString(data.createdAt!)
                        .toString(),
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
      ),
    );
  }
}
