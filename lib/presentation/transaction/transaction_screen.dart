import 'package:app/data/model/models.dart';
import 'package:app/gen/export.dart';
import 'package:app/presentation/exports.dart';
import 'package:app/presentation/transaction/enums.dart';
import 'package:app/presentation/transaction/extenstion.dart';
import 'package:app/providers/exports.dart';
import 'package:app/utils/enums/enums.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionScreen extends HookConsumerWidget {
  const TransactionScreen({
    super.key,
    required this.actionType,
  });
  final TransactionActionEnum actionType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Variables
    final ValueNotifier<String> currentDes = useState("");
    final ValueNotifier<int> currentMoneyValue = useState(0);
    final ValueNotifier<TransactionCategoryEnum?> currentCate = useState(null);
    final ValueNotifier<TransactionType?> currentTrans = useState(null);
    final ValueNotifier<AccountBankModel?> currentAccountBank = useState(null);
    // End Variables

    List<AccountBankModel> accountBankListNotifier =
        ref.watch(accountBankListNotifierProvider);
    final fetchData = useCallback(() async {
      final String? userId = await AppSharePreferences().getUserId();
      ref
          .read(accountBankListNotifierProvider.notifier)
          .getAccountBankList(ref, userId!);
    });
    useEffect(() {
      fetchData();
      return () {};
    }, []);
    

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
                  "How much",
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
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            final text = newValue.text;
                            return text.isEmpty
                                ? newValue
                                : double.tryParse(text) == null
                                    ? oldValue
                                    : newValue;
                          }),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontFamily: FontFamily.dMSans,
                            fontSize: 50.sp,
                            color: AppColors.textColor1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (value) {
                          currentMoneyValue.value = int.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
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
                      CommonDropdownButton(
                        customMargin: const EdgeInsets.only(bottom: 14),
                        hintText: "Category",
                        items: TransactionCategoryEnum.toStringList(),
                        onChange: (value, index) {
                          currentCate.value =
                              TransactionCategoryEnum.values[index];
                        },
                      ),
                      CommonTextField(
                        customMargin: const EdgeInsets.only(bottom: 14),
                        hintText: "Description",
                        textFieldStyle: TextFieldStyleEnum.border,
                        onChanged: (value) {
                          currentDes.value = value;
                        },
                      ),
                      CommonDropdownButton(
                        customMargin: const EdgeInsets.only(bottom: 14),
                        hintText: "Wallet",
                        items: accountBankListNotifier
                            .map((e) => e.name ?? "")
                            .toList(),
                        onChange: (value, index) {
                          currentAccountBank.value =
                              accountBankListNotifier[index];
                        },
                      ),
                      CommonDropdownButton(
                        hintText: "Transaction Type",
                        items: TransactionType.toStringList(),
                        onChange: (p0, selectIndex) {
                          currentTrans.value =
                              TransactionType.values[selectIndex];
                        },
                      ),
                      SizedBox(height: 40.h),
                      CommonGradientButton(
                        customWidth: double.infinity,
                        contentButton: actionType.getContentButton(),
                        onTap: () {
                          handleAddTransaction(
                            ref,
                            context,
                            moneyValue: currentMoneyValue.value,
                            transactionType: currentTrans.value!.name,
                            description: currentDes.value,
                            accountBankId:
                                currentAccountBank.value!.accountBankId!,
                            category: currentCate.value!.name,
                          );
                        },
                      ),
                      SizedBox(height: 20.h)
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
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
                "Transaction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor1,
                  fontSize: 18.sp,
                  fontFamily: FontFamily.syne,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
