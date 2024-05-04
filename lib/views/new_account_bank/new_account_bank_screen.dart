import 'package:app/gen/export.dart';
import 'package:app/gen/fonts.gen.dart';
import 'package:app/views/exports.dart';
import 'package:app/views/new_account_bank/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NewAccountBanksScreen extends StatefulWidget {
  const NewAccountBanksScreen({
    super.key,
    required this.action,
  });
  final NewAccountActionEnum action;

  @override
  State<NewAccountBanksScreen> createState() => _NewAccountBanksScreenState();
}

class _NewAccountBanksScreenState extends State<NewAccountBanksScreen> {
  @override
  void initState() {
    super.initState();
    print("=== ${widget.action}");
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildAppBar(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.textColor1,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      r"$",
                      style: TextStyle(
                        fontSize: 50.sp,
                        color: AppColors.textColor1,
                        fontFamily: FontFamily.poppins,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontFamily: FontFamily.dMSans,
                          fontSize: 50.sp,
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          hintText: "00.0",
                          hintStyle: TextStyle(
                            fontFamily: FontFamily.dMSans,
                            fontSize: 50.sp,
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonTextField(
                        customMargin: EdgeInsets.only(bottom: 14),
                        hintText: "Name",
                        textFieldStyle: TextFieldStyleEnum.border,
                        onChanged: (value) {
                          // TODO: on change username,
                        },
                      ),
                      CommonTextField(
                        customMargin: EdgeInsets.only(bottom: 14),
                        readOnly: true,
                        hintText: "Account Type",
                        textFieldStyle: TextFieldStyleEnum.border,
                        onChanged: (value) {
                          // TODO: on change username,
                        },
                      ),
                      _buildAccountBankList(),
                      SizedBox(height: 40.h),
                      CommonGradientButton(
                        customWidth: double.infinity,
                        contentButton: "Add",
                        onTap: () {
                          context.goNamed(AppRouters.signUpSuccessRoute);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAccountBankList() {
    List<Map<String, dynamic>> imageList = [
      {
        "name": "bank",
        "image_path": Assets.icons.icBankAmerica.path,
      },
      {
        "name": "bca",
        "image_path": Assets.icons.icBca.path,
      },
      {
        "name": "chase",
        "image_path": Assets.icons.icChase.path,
      },
      {
        "name": "citi",
        "image_path": Assets.icons.icCiti.path,
      },
      {
        "name": "mandiri",
        "image_path": Assets.icons.icMandiri.path,
      },
      {
        "name": "paypal",
        "image_path": Assets.icons.paypal.path,
      },
      {"name": "none", "image_path": ""},
    ];
    return GridView.builder(
      itemCount: imageList.length,
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1 / .5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 80.h,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(8.r)),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: index == imageList.length - 1
                ? Text(
                    "Other",
                    style: TextStyle(
                      color: AppColors.primaryColor5,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : SvgPicture.asset(
                    imageList[index]["image_path"],
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
          ),
        );
      },
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
              onTap: () => context.goNamed(AppRouters.setUpAccountIntroRoute),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textColor1,
              ),
            ),
            Expanded(
              child: Text(
                "Add new wallet",
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
