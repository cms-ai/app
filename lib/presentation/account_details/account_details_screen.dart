import 'package:app/gen/export.dart';
import 'package:app/presentation/exports.dart';
import 'package:app/presentation/new_account_bank/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({
    super.key,
  });

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAppBar(context),
                SizedBox(height: 20.h),
                Text(
                  "Account Balance",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.textColor1,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  r"$9400",
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: AppColors.textColor1,
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "History",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.textColor2,
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(0),
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
                SizedBox(
                  height: 16.h,
                )
              ],
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
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
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
                "Detail account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18.sp,
                  fontFamily: FontFamily.syne,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                context.goNamed(AppRouters.newAccountBankProfileRoute,
                    queryParameters: {"action": NewAccountActionEnum.edit.name})
              },
              child: Icon(
                Icons.edit,
                color: AppColors.textColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
