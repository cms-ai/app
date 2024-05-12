import 'package:app/gen/export.dart';
import 'package:app/presentation/exports.dart';
import 'package:app/presentation/new_account_bank/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    super.key,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.textColor1.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.all(0.0),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: true,
                    itemBuilder: (context, index) => _buildOtion(
                      content: "Wallet",
                      iconWidget: Assets.icons.icAccount.svg(),
                      onTap: () {
                        context.goNamed(AppRouters.accountDetailsRoute);
                      },
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.h,
                    ),
                    itemCount: 4,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CommonGradientButton(
                    customWidth: double.infinity,
                    contentButton: "+ Add new wallet",
                    onTap: () {
                      context.goNamed(AppRouters.newAccountBankProfileRoute,
                          queryParameters: {
                            "action": NewAccountActionEnum.add.name
                          });
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

  Widget _buildOtion({
    required Function onTap,
    required String content,
    required Widget iconWidget,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.textColor1.withOpacity(.8),
              ),
              child: iconWidget,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor1,
                ),
              ),
            ),
            Text(
              r"$400",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor1,
              ),
            ),
          ],
        ),
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
                "Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18.sp,
                  fontFamily: FontFamily.syne,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
