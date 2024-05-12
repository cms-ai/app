import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:app/presentation/common_views/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  final Function onTap;
  const LoginView({super.key, required this.onTap});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Assets.images.logoWithImage1.image(),
          const Spacer(),
          // CommonTextField(
          //   customMargin: const EdgeInsets.only(bottom: 14),
          //   hintText: "Email",
          //   onChanged: (value) {
          //     // TODO: on change username,
          //   },
          // ),
          // CommonTextField(
          //   customMargin: const EdgeInsets.only(bottom: 40),
          //   hintText: "Password",
          //   onChanged: (value) {
          //     // TODO: on change pass,
          //   },
          // ),

          CommonGradientButton(
            customWidth: double.infinity,
            contentButton: "Sign in with Google",
            prefixWidget: Container(
              margin: EdgeInsets.only(right: 10.w),
              child: Assets.icons.icGoogle.svg(
                height: 20,
              ),
            ),
            onTap: () {
              // context.goNamed(AppRouters.setUpAccountIntroRoute);
              widget.onTap();
            },
          ),
          SizedBox(height: 10.h),
          CommonGradientButton(
            customWidth: double.infinity,
            contentButton: "Use demo account",
            onTap: () {
              context.goNamed(AppRouters.setUpAccountIntroRoute);
            },
          ),
          SizedBox(height: 20.h),

          Text(
            "By signin, you agree to the Terms of Service and Privacy Policy",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.primaryColor4,
            ),
          ),
          // SizedBox(height: 20.h),
          // RichText(
          //   text: TextSpan(
          //     children: [
          //       const TextSpan(text: "You don't have an account? "),
          //       TextSpan(
          //         text: "Sign up",
          //         recognizer: TapGestureRecognizer()
          //           ..onTap = () => widget.onTap(),
          //         style: TextStyle(
          //             color: AppColors.textColor2,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 14.sp),
          //       )
          //     ],
          //   ),
          // ),
          // const Spacer(
          //   flex: 2,
          // ),

          SizedBox(
            height: 60.h,
          ),
          Text(
            "Author: @tcaidev",
            style: TextStyle(
              fontFamily: FontFamily.poppins,
              fontSize: 10.sp,
              color: AppColors.textColor1.withOpacity(.2),
            ),
          ),
          SizedBox(height: 16.h)
        ],
      ),
    );
  }
}
