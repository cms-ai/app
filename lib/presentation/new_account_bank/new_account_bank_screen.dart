import 'package:app/gen/export.dart';
import 'package:app/presentation/exports.dart';
import 'package:app/presentation/new_account_bank/enums.dart';
import 'package:app/providers/exports.dart';
import 'package:app/utils/enums/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewAccountBanksScreen extends HookConsumerWidget {
  const NewAccountBanksScreen({
    super.key,
    required this.action,
  });
  final NewAccountActionEnum action;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    ValueNotifier<AccoutBankTypeEnum> accountType =
        useState(AccoutBankTypeEnum.chase);
    ref.listen(
      accountBankStateScreenProvider,
      (previous, next) {
        if (previous != next) {
          switch (next) {
            case AccountBankStateScreenEnum.loading:
              EasyLoading.show(status: 'loading...');
              break;
            case AccountBankStateScreenEnum.success:
              EasyLoading.showSuccess("Tạo thành công");
              ref.read(accountBankStateScreenProvider.notifier).state =
                  AccountBankStateScreenEnum.initial;
              if (action == NewAccountActionEnum.add) {
                context.goNamed(AppRouters.signUpSuccessRoute);
              } else if ((action == NewAccountActionEnum.add)) {
                // TODO: handle route edit
                context.pop();
              } else {
                // TODO: handle route delete
              }
              break;
            case AccountBankStateScreenEnum.failure:
              EasyLoading.showError("Tạo thất bại. Xin vui lòng thử lại");
              ref.read(accountBankStateScreenProvider.notifier).state =
                  AccountBankStateScreenEnum.initial;
            default:
          }
        }
      },
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColors.bgColor1,
            ),
          ),
          Positioned(
            top: size.height * 0.9,
            left: size.width * 0.3,
            child: Container(
              width: 359.w,
              height: 849.h,
              decoration: BoxDecoration(
                color: AppColors.subColor1.withOpacity(.5),
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(200, 500),
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildAppBar(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.textColor1,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      r"$",
                      style: TextStyle(
                        fontSize: 50.sp,
                        color: AppColors.textColor1,
                        fontFamily: FontFamily.poppins,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontFamily: FontFamily.dMSans,
                          fontSize: 50.sp,
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          hintText: "00.0",
                          hintStyle: TextStyle(
                            fontFamily: FontFamily.dMSans,
                            fontSize: 50.sp,
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonTextField(
                        controller: nameController,
                        customMargin: const EdgeInsets.only(bottom: 14),
                        hintText: "Name",
                        textFieldStyle: TextFieldStyleEnum.border,
                      ),
                      CommonTextField(
                        customMargin: const EdgeInsets.only(bottom: 14),
                        readOnly: true,
                        hintText: "Account Type",
                        controller: TextEditingController(
                            text: accountType.value.getString()),
                        textFieldStyle: TextFieldStyleEnum.border,
                      ),
                      _buildAccountBankList(accountType.value,
                          (AccoutBankTypeEnum value) {
                        accountType.value = value;
                      }),
                      SizedBox(height: 40.h),
                      CommonGradientButton(
                        customWidth: double.infinity,
                        contentButton: action == NewAccountActionEnum.add
                            ? "Add"
                            : "Update",
                        onTap: () {
                          ref
                              .read(accountBankListNotifierProvider.notifier)
                              .addAccountBank(
                                ref,
                                ref.read(userProvider.notifier).state!.userId!,
                                "0",
                                nameController.text.trim(),
                                accountType.value.name,
                              );
                          // context.goNamed(AppRouters.signUpSuccessRoute);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAccountBankList(
    AccoutBankTypeEnum currentValue,
    Function onTap,
  ) {
    return GridView.builder(
      itemCount: AccoutBankTypeEnum.values.length,
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1 / .5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => onTap(AccoutBankTypeEnum.values[index]),
          child: Container(
            height: 80.h,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AccoutBankTypeEnum.values[index] == currentValue
                      ? AppColors.primaryColor
                      : AppColors.primaryColor4,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Center(
              child: AccoutBankTypeEnum.values[index].getIcon() ??
                  Text(
                    "Other",
                    style: TextStyle(
                      color: AppColors.primaryColor5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textColor1,
              ),
            ),
            Expanded(
              child: Text(
                action == NewAccountActionEnum.add
                    ? "Add new wallet"
                    : "Edit account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18.sp,
                  fontFamily: FontFamily.syne,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (action == NewAccountActionEnum.edit)
              Icon(
                Icons.delete_outline_rounded,
                color: AppColors.textColor1,
              )
          ],
        ),
      ),
    );
  }
}
