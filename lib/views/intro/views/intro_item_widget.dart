import 'package:app/gen/fonts.gen.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroItemWidget extends StatelessWidget {
  const IntroItemWidget({
    super.key,
    required this.image,
    this.title = "",
    this.description = "",
  });
  final Widget image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 40.h),
        SizedBox(height: 200.h, width: 312.h, child: image),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.sp,
            color: AppColors.textColor1,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.poppins,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.primaryColor4,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.poppins,
          ),
        )
      ],
    );
  }
}
