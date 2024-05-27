import 'package:app/core/result.dart';
import 'package:app/data/model/models.dart';
import 'package:app/gen/export.dart';
import 'package:app/presentation/budget_details/data/budget_extra_model.dart';
import 'package:app/providers/budget_provider.dart';
import 'package:app/providers/exports.dart';
import 'package:app/utils/enums/enums.dart';
import 'package:app/utils/utils.dart';
import 'package:app/presentation/common_views/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'providers/budget_screen_provider.dart';
part 'providers/extenstions.dart';

class BudgetBodyScreen extends HookConsumerWidget {
  const BudgetBodyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchData = useCallback(handleFetchData);
    useEffect(() {
      fetchData(ref);
      return () {};
    }, []);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => handleChangeMoth(
                    ref, ref.read(_monthIndexProvider.notifier).state - 1),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primaryColor4,
                ),
              ),
              Expanded(
                child: Text(
                  AppDateTime.months[ref.watch(_monthIndexProvider)],
                  // "Budget",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.textColor1,
                    fontFamily: FontFamily.dMSans,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => handleChangeMoth(
                    ref, ref.read(_monthIndexProvider.notifier).state + 1),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primaryColor4,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF).withOpacity(.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FutureBuilder<int>(
                          future: handleGetSpendMoney(
                              ref, ref.watch(_currentBudgetList)[index]),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            }
                            return _buildBudgetItem(
                              context,
                              currentValue: snapshot.data,
                              data: ref.watch(_currentBudgetList)[index],
                              onTap: () {
                                context.goNamed(AppRouters.budgetDetailsRoute,
                                    extra: (
                                      ref.watch(_currentBudgetList)[index],
                                      snapshot.data
                                    ));
                              },
                            );
                          });
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                    itemCount: ref.watch(_currentBudgetList).length,
                  ),
                ),
                SizedBox(height: 20.h),
                CommonGradientButton(
                  customWidth: double.infinity,
                  contentButton: "Create a budget",
                  onTap: () {
                    context.goNamed(AppRouters.budgetRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetItem(
    BuildContext context, {
    required int currentValue,
    required BudgetModel data,
    required Function onTap,
  }) {
    final remainMoney = (data.maxMoney ?? 0) - currentValue;
    final indexCategory = TransactionCategoryEnum.values
        .indexWhere((element) => element.name == data.budgetName);
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.textColor2,
            ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: TransactionCategoryEnum.values[indexCategory]
                          .getBgColor()
                          .withOpacity(.3),
                      border: Border.all(
                        color: TransactionCategoryEnum.values[indexCategory]
                            .getBgColor()
                            .withOpacity(.5),
                      ),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 14.h,
                                width: 14.h,
                                decoration: BoxDecoration(
                                  color: TransactionCategoryEnum
                                      .values[indexCategory]
                                      .getBgColor(),
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 4.h),
                          Text(
                            data.budgetName ?? "",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textColor1,
                              fontFamily: FontFamily.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (remainMoney <= 0) Assets.icons.icBugdetLimit.svg()
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              "Remaining \$${remainMoney > 0 ? remainMoney : 0}",
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.textColor1,
                fontFamily: FontFamily.dMSans,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            CommonProgessBar(
              percent: currentValue / (data.maxMoney ?? 1),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 10,
              color: TransactionCategoryEnum.values[indexCategory].getBgColor(),
            ),
            SizedBox(height: 4.h),
            Text(
              "\$$currentValue of \$${data.maxMoney}",
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textColor1.withOpacity(.5),
                fontFamily: FontFamily.dMSans,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (remainMoney <= 0)
              Text(
                r"You’ve exceed the limit!",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor2,
                  fontFamily: FontFamily.dMSans,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
