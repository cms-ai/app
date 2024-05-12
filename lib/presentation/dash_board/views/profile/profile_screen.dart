import 'package:app/gen/assets.gen.dart';
import 'package:app/gen/fonts.gen.dart';
import 'package:app/utils/utils.dart';
import 'package:app/presentation/common_views/exports.dart';
import 'package:app/presentation/dash_board/views/profile/views/exports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textColor1),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://vtv1.mediacdn.vn/thumb_w/650/562122370168008704/2023/6/14/photo1686714465501-16867144656101728954756.png"),
                ),
              ),
              SizedBox(width: 14.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: FontFamily.dMSans,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor1,
                    ),
                  ),
                  Text(
                    "Iriana Saliha",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColor1,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
                color: AppColors.textColor1.withOpacity(.1),
                borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              children: [
                _buildOtion(
                  content: "Account",
                  iconWidget: Assets.icons.icAccount.svg(),
                  onTap: () {
                    context.goNamed(AppRouters.accountRoute);
                  },
                ),
                // SizedBox(height: 20.h),
                // _buildOtion(
                //     content: "Settings",
                //     iconWidget: Assets.icons.icSettings.svg(),
                //     onTap: () {}),
                SizedBox(height: 20.h),
                _buildOtion(
                  content: "Delete account",
                  iconWidget: Assets.icons.icUpload.svg(),
                  onTap: () {
                     CommonButtonSheet(
                      customChild: DeleteAccountWidget(),
                    ).show(context);
                  },
                ),
                SizedBox(height: 20.h),
                _buildOtion(
                  content: "Logout",
                  iconWidget: Assets.icons.icLogout.svg(),
                  onTap: () {
                    CommonButtonSheet(
                      customChild: LogOutBottomSheet(),
                    ).show(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOtion({
    required Function onTap,
    required String content,
    required Widget iconWidget,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.textColor1.withOpacity(.8),
              ),
              child: iconWidget,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontFamily.poppins,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor1,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: AppColors.textColor1)
          ],
        ),
      ),
    );
  }
}
