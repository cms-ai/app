import 'package:app/data/model/models.dart';
import 'package:app/gen/export.dart';
import 'package:app/providers/exports.dart';
import 'package:app/utils/utils.dart';
import 'package:app/presentation/dash_board/providers/dash_board_provider.dart';
import 'package:app/presentation/dash_board/views/enums.dart';
import 'package:app/presentation/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransaction extends ConsumerWidget {
  const RecentTransaction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionList = ref.watch(transactionListNotifierProvider);

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
              GestureDetector(
                onTap: () {
                  ref.read(navBarProvider.notifier).state =
                      BottomNavBarEnum.transition.index;
                },
                child: Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontFamily.poppins,
                    color: AppColors.textColor2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            itemCount: transactionList.length,
            itemBuilder: (context, index) {
              return CommonTransactionItem(
                data: transactionList[index],
              );
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
