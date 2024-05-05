import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:app/views/common_views/exports.dart';
import 'package:flutter/gestures.dart';
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
          Assets.images.logoWithImage1.image(height: 100),
          const Spacer(),
          CommonTextField(
            customMargin: const EdgeInsets.only(bottom: 14),
            hintText: "Email",
            onChanged: (value) {
              // TODO: on change username,
            },
          ),
          CommonTextField(
            customMargin: const EdgeInsets.only(bottom: 40),
            hintText: "Password",
            onChanged: (value) {
              // TODO: on change pass,
            },
          ),
          Text(
            "By signin, you agree to the Terms of Service and Privacy Policy",
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.primaryColor4,
            ),
          ),
          SizedBox(height: 20.h),
          CommonGradientButton(
            customWidth: double.infinity,
            contentButton: "Sign in",
            onTap: () {
              context.goNamed(AppRouters.setUpAccountIntroRoute);
            },
          ),
          SizedBox(height: 20.h),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: "You don't have an account? "),
                TextSpan(
                  text: "Sign up",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => widget.onTap(),
                  style: TextStyle(
                      color: AppColors.textColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                )
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
