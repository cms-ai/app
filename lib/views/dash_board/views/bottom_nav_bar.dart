import 'dart:io';

import 'package:app/utils/utils.dart';
import 'package:app/views/dash_board/domain/repositories.dart';
import 'package:app/views/dash_board/views/exports.dart';
import 'package:app/views/transaction/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  // BottomNavBarEnum currentNavBar = BottomNavBarEnum.home;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNavBarIndex =
        BottomNavBarEnum.values[ref.watch(navBarProvider)];
    return Column(
      children: [
        Container(
          alignment: AlignmentDirectional.topCenter,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF141326).withOpacity(.06),
            Color(0xFF141326),
          ])),
          // BottomNavBarEnum
          child: Column(
            children: [
              Container(
                height: 60.h,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...BottomNavBarEnum.values.map(
                      (value) => _buildNavBarItem(context,
                          currentNavBar: value,
                          isSelected: value == currentNavBarIndex, onTap: () {
                        if (value != BottomNavBarEnum.add) {
                          ref.read(navBarProvider.notifier).state =
                              BottomNavBarEnum.values.indexOf(value);
                        } else {
                          context.goNamed(AppRouters.transactionRoute,
                              queryParameters: {
                                "action": TransactionActionEnum.add.name,
                              });
                        }
                      }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Platform.isIOS ? 16.h : 0.h,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavBarItem(
    BuildContext context, {
    required BottomNavBarEnum currentNavBar,
    required bool isSelected,
    required Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: SizedBox(
          height: double.infinity,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: AppColors.textColor2.withOpacity(.4),
                            blurRadius: 20,
                          )
                        ]
                      : [],
                  borderRadius: BorderRadius.circular(50.r)),
              child: SvgPicture.asset(
                currentNavBar.handleGetIcon(),
                color: isSelected ? AppColors.textColor2 : AppColors.textColor1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
