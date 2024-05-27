import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonProgessBar extends StatelessWidget {
  const CommonProgessBar(
      {super.key,
      required this.percent,
      required this.width,
      required this.height,
      required this.color});
  final double percent;
  final double width;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1FA).withOpacity(.2),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: width * percent,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        )
      ],
    );
  }
}
