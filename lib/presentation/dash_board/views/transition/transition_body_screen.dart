import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:app/presentation/common_views/exports.dart';
import 'package:app/presentation/dash_board/views/transition/views/filter_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TransitionBodyScreen extends StatefulWidget {
  const TransitionBodyScreen({super.key});

  @override
  State<TransitionBodyScreen> createState() => _TransitionBodyScreenState();
}

class _TransitionBodyScreenState extends State<TransitionBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          _buildAppBar(context),
          GestureDetector(
            onTap: () {
              context.goNamed(AppRouters.financialReportRoute);
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 14.h),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF).withOpacity(.2),
                  borderRadius: BorderRadius.circular(14.r)),
              child: Row(
                children: [
                  Text(
                    "See your financial report",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.poppins,
                      color: AppColors.textColor1,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 50,
              itemBuilder: (context, index) {
                return CommonTransactionItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.h);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.textColor2,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Assets.icons.icArrowDown.svg(color: AppColors.textColor1),
                  const SizedBox(width: 10),
                  Text(
                    "Month",
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
            const Spacer(),
            GestureDetector(
              onTap: () {
                CommonButtonSheet(
                  customChild: FilterBodyWidget(),
                ).show(context);
              },
              child: Icon(
                Icons.filter_list,
                color: AppColors.textColor2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
