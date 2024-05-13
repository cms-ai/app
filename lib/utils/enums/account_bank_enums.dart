import 'package:app/gen/export.dart';
import 'package:flutter/material.dart';

// This enum using for auth_screen 
enum AccountBankStateScreenEnum {
  initial,
  loading,
  success,
  failure;
}

enum AccoutBankTypeEnum {
  chase,
  paypal,
  citi,
  bankOfAmerican,
  mandiri,
  bca,
  other,
}

extension AccoutBankTypeEnumExt on AccoutBankTypeEnum {
  Widget? getIcon() {
    switch (this) {
      case AccoutBankTypeEnum.chase:
        return Assets.icons.icChase.svg();
      case AccoutBankTypeEnum.paypal:
        return Assets.icons.paypal.svg();
      case AccoutBankTypeEnum.citi:
        return Assets.icons.icCiti.svg();
      case AccoutBankTypeEnum.bankOfAmerican:
        return Assets.icons.icBankAmerica.svg();
      case AccoutBankTypeEnum.mandiri:
        return Assets.icons.icMandiri.svg();
      case AccoutBankTypeEnum.bca:
        return Assets.icons.icBca.svg();
      default:
        return null;
    }
  }

  String getString() {
    switch (this) {
      case AccoutBankTypeEnum.chase:
        return "Chase";
      case AccoutBankTypeEnum.paypal:
        return "Paypal";
      case AccoutBankTypeEnum.citi:
        return "Citi";
      case AccoutBankTypeEnum.bankOfAmerican:
        return "Bank of American";
      case AccoutBankTypeEnum.mandiri:
        return "Mandiri";
      case AccoutBankTypeEnum.bca:
        return "BCA";
      case AccoutBankTypeEnum.other:
        return "Other";
    }
  }
}
