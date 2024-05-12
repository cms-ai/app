import 'dart:ui';
import 'package:app/presentation/financial_report/domain/financial_report_repo.dart';
import 'package:app/presentation/financial_report/views/exports.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinancialReportScreen extends ConsumerStatefulWidget {
  const FinancialReportScreen({super.key});

  @override
  FinancialReportScreenState createState() => FinancialReportScreenState();
}

class FinancialReportScreenState extends ConsumerState<FinancialReportScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = ref.watch(financialTabProvider);
    final PageController controller = PageController(initialPage: currentTab);

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
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        ...List.generate(
                          4,
                          (index) => Expanded(
                            child: AnimatedContainer(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              duration: Duration(milliseconds: 500),
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: currentTab == index
                                    ? AppColors.textColor1
                                    : AppColors.textColor1.withOpacity(.1),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: controller,
                      children: const [
                        ExpenseBodyWidget(),
                        IncomeBodyWidget(),
                        BudgetBodyWidget(),
                        QuoteBodyWidget(),
                      ],
                      onPageChanged: (value) {
                        ref.watch(financialTabProvider.notifier).state = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
