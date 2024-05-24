import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextFieldStyleEnum {
  initial,
  border,
}

class CommonTextField extends StatefulWidget {
  final EdgeInsetsGeometry? customMargin;
  final String? hintText;
  final Function(String value)? onChanged;
  final TextFieldStyleEnum textFieldStyle;
  final bool readOnly;
  final TextEditingController? controller;
  final void Function()? onTap;
  const CommonTextField({
    super.key,
    this.customMargin,
    this.hintText,
    this.onChanged,
    this.textFieldStyle = TextFieldStyleEnum.initial,
    this.readOnly = false,
    this.controller,
    this.onTap,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    switch (widget.textFieldStyle) {
      case TextFieldStyleEnum.initial:
        return _buildInitalTextField();
      case TextFieldStyleEnum.border:
        return _buildBorderTextField();
    }
  }

  Widget _buildInitalTextField() {
    return Container(
      width: double.infinity,
      margin: widget.customMargin,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFF19173D).withOpacity(.5),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: widget.readOnly,
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
        onTap: widget.onTap,
      ),
    );
  }

  Widget _buildBorderTextField() {
    return Container(
      width: double.infinity,
      margin: widget.customMargin,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        // color: const Color(0xFF19173D).withOpacity(.5),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: const Color(0xFF19173D).withOpacity(.5),
        ),
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: FontFamily.dMSans,
            fontSize: 13.sp,
            color: Colors.grey[500],
          ),
        ),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
      ),
    );
  }
}
