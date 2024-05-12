import 'package:app/gen/export.dart';
import 'package:flutter/material.dart';

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
}
