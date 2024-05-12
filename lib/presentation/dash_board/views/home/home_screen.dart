import 'package:app/gen/export.dart';
import 'package:app/utils/utils.dart';
import 'package:app/presentation/common_views/exports.dart';
import 'package:app/presentation/dash_board/views/home/views/exports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAppBar(),
          _buildAccountBalance(),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Spend Frequency",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textColor1,
                  fontFamily: FontFamily.dMSans,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const CommonChart(),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                ...FilterType.values.map(
                  (e) => _buildFilterTime(
                    isSelected: e == FilterType.toDay,
                    title: e.getTitle(),
                  ),
                )
              ],
            ),
          ),
          RecentTransaction()
        ],
      ),
    );
  }

  Widget _buildFilterTime({
    required bool isSelected,
    required String title,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.textColor2.withOpacity(.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color:
                  isSelected ? AppColors.textColor2 : const Color(0xFF91919F),
              fontFamily: FontFamily.poppins,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountBalance() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Text(
            "Available Balance",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textColor2,
              fontFamily: FontFamily.dMSans,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            r"$9400",
            style: TextStyle(
              fontSize: 24.sp,
              color: AppColors.textColor1,
              fontFamily: FontFamily.dMSans,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBalanceItem(
                bgColor: Colors.green,
                icon: Assets.icons.icIncome,
                title: "Income",
                value: r"$5000",
              ),
              _buildBalanceItem(
                bgColor: Colors.red,
                icon: Assets.icons.icExpense,
                title: "Expenses",
                value: r"$1200",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.textColor1),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://vtv1.mediacdn.vn/thumb_w/650/562122370168008704/2023/6/14/photo1686714465501-16867144656101728954756.png"),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.textColor2,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Assets.icons.icArrowDown.svg(color: AppColors.textColor1),
                const SizedBox(width: 10),
                Text(
                  "October",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.poppins,
                    color: AppColors.textColor1,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 32,
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceItem({
    required Color bgColor,
    required String title,
    required String value,
    required SvgGenImage icon,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(24.r)),
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.h,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.textColor1,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: icon.svg(width: 24.w, color: bgColor),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.textColor1,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.textColor1,
                  fontFamily: FontFamily.dMSans,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
