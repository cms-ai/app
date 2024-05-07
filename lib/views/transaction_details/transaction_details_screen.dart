import 'package:app/gen/export.dart';
import 'package:app/views/exports.dart';
import 'package:app/views/transaction/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key});

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColors.bgColor1,
            ),
          ),
          Positioned(
            top: size.height * 0.9,
            left: size.width * 0.3,
            child: Container(
              width: 359.w,
              height: 849.h,
              decoration: BoxDecoration(
                color: AppColors.subColor1.withOpacity(.5),
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(200, 500),
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAppBar(context),
                  SizedBox(height: 20.h),
                  Text(
                    r"$4000",
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: AppColors.textColor1,
                      fontFamily: FontFamily.dMSans,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Saturday 4 June 2021, 16:20",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textColor1,
                      fontFamily: FontFamily.dMSans,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF).withOpacity(.1),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      children: [
                        _buildDescription(title: "Type", content: "Transfer"),
                        _buildDescription(title: "Category", content: "Salary"),
                        _buildDescription(title: "Income", content: "Chase"),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF).withOpacity(.1),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.textColor1,
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Expanded(
                              child: ListView(
                            padding: EdgeInsets.all(0),
                            children: [
                              Text(
                                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.textColor1,
                                  fontFamily: FontFamily.dMSans,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CommonGradientButton(
                      customWidth: double.infinity,
                      contentButton: "Update",
                      onTap: () {
                        context.goNamed(AppRouters.editTransactionRoute,
                            queryParameters: {
                              "action": TransactionActionEnum.edit.name,
                            });
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDescription({required String title, required String content}) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: AppColors.textColor1, fontSize: 14.sp),
          ),
          Text(
            content,
            style: TextStyle(
              color: AppColors.textColor1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
          )
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
            GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textColor1,
              ),
            ),
            Expanded(
              child: Text(
                "Detail Transaction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18.sp,
                  fontFamily: FontFamily.syne,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.delete_outline_rounded,
              color: AppColors.textColor1,
            )
          ],
        ),
      ),
    );
  }
}
