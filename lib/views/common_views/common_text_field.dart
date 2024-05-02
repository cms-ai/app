import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatefulWidget {
  final EdgeInsetsGeometry? customMargin;
  final String? hintText;
  final Function(String value)? onChanged;
  const CommonTextField(
      {super.key, this.customMargin, this.hintText, this.onChanged});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: widget.customMargin,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFF19173D).withOpacity(.5),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: FontFamily.dMSans,
            fontSize: 13.sp,
            color: AppColors.textColor1.withOpacity(.66),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
