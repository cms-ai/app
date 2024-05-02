import 'package:app/gen/export.dart';
import 'package:app/views/common_views/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

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
            customMargin: EdgeInsets.only(bottom: 14),
            hintText: "Enter username...",
            onChanged: (value) {
              // TODO: on change username,
            },
          ),
          CommonTextField(
            customMargin: EdgeInsets.only(bottom: 50),
            hintText: "Enter password...",
            onChanged: (value) {
              // TODO: on change pass,
            },
          ),
          CommonGradientButton(
            customWidth: 200.w,
            contentButton: "Login",
            onTap: () {},
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
