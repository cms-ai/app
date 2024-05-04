import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonGradientButton extends StatelessWidget {
  final String contentButton;
  final double? customWidth;
  final Function()? onTap;
  const CommonGradientButton({
    super.key,
    required this.contentButton,
    this.onTap,
    this.customWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: customWidth,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFE3823C),
              Color(0xFFE33C3C),
            ],
          ),
          border: Border.all(color: const Color(0xFFFFFFFF).withOpacity(.5)),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Text(
          contentButton,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamily.dMSans,
            fontSize: 13.sp,
            color: AppColors.textColor1.withOpacity(.87),
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
