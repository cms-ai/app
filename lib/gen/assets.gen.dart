/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsBottomNavBarGen get bottomNavBar =>
      const $AssetsIconsBottomNavBarGen();

  /// File path: assets/icons/ic_arrow_down.svg
  SvgGenImage get icArrowDown =>
      const SvgGenImage('assets/icons/ic_arrow_down.svg');

  /// File path: assets/icons/ic_bank_america.svg
  SvgGenImage get icBankAmerica =>
      const SvgGenImage('assets/icons/ic_bank_america.svg');

  /// File path: assets/icons/ic_bca.svg
  SvgGenImage get icBca => const SvgGenImage('assets/icons/ic_bca.svg');

  /// File path: assets/icons/ic_bugdet_limit.svg
  SvgGenImage get icBugdetLimit =>
      const SvgGenImage('assets/icons/ic_bugdet_limit.svg');

  /// File path: assets/icons/ic_chase.svg
  SvgGenImage get icChase => const SvgGenImage('assets/icons/ic_chase.svg');

  /// File path: assets/icons/ic_citi.svg
  SvgGenImage get icCiti => const SvgGenImage('assets/icons/ic_citi.svg');

  /// File path: assets/icons/ic_expense.svg
  SvgGenImage get icExpense => const SvgGenImage('assets/icons/ic_expense.svg');

  /// File path: assets/icons/ic_income.svg
  SvgGenImage get icIncome => const SvgGenImage('assets/icons/ic_income.svg');

  /// File path: assets/icons/ic_jago.svg
  SvgGenImage get icJago => const SvgGenImage('assets/icons/ic_jago.svg');

  /// File path: assets/icons/ic_mandiri.svg
  SvgGenImage get icMandiri => const SvgGenImage('assets/icons/ic_mandiri.svg');

  /// File path: assets/icons/ic_sign_up_success.svg
  SvgGenImage get icSignUpSuccess =>
      const SvgGenImage('assets/icons/ic_sign_up_success.svg');

  /// File path: assets/icons/paypal.svg
  SvgGenImage get paypal => const SvgGenImage('assets/icons/paypal.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icArrowDown,
        icBankAmerica,
        icBca,
        icBugdetLimit,
        icChase,
        icCiti,
        icExpense,
        icIncome,
        icJago,
        icMandiri,
        icSignUpSuccess,
        paypal
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIntroGen get intro => const $AssetsImagesIntroGen();

  /// File path: assets/images/logo_with_image_1.png
  AssetGenImage get logoWithImage1 =>
      const AssetGenImage('assets/images/logo_with_image_1.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoWithImage1];
}

class $AssetsIconsBottomNavBarGen {
  const $AssetsIconsBottomNavBarGen();

  /// File path: assets/icons/bottom_nav_bar/ic_add.svg
  SvgGenImage get icAdd =>
      const SvgGenImage('assets/icons/bottom_nav_bar/ic_add.svg');

  /// File path: assets/icons/bottom_nav_bar/ic_budget.svg
  SvgGenImage get icBudget =>
      const SvgGenImage('assets/icons/bottom_nav_bar/ic_budget.svg');

  /// File path: assets/icons/bottom_nav_bar/ic_home.svg
  SvgGenImage get icHome =>
      const SvgGenImage('assets/icons/bottom_nav_bar/ic_home.svg');

  /// File path: assets/icons/bottom_nav_bar/ic_profile.svg
  SvgGenImage get icProfile =>
      const SvgGenImage('assets/icons/bottom_nav_bar/ic_profile.svg');

  /// File path: assets/icons/bottom_nav_bar/ic_transaction.svg
  SvgGenImage get icTransaction =>
      const SvgGenImage('assets/icons/bottom_nav_bar/ic_transaction.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [icAdd, icBudget, icHome, icProfile, icTransaction];
}

class $AssetsImagesIntroGen {
  const $AssetsImagesIntroGen();

  /// File path: assets/images/intro/intro_1.png
  AssetGenImage get intro1 =>
      const AssetGenImage('assets/images/intro/intro_1.png');

  /// File path: assets/images/intro/intro_2.png
  AssetGenImage get intro2 =>
      const AssetGenImage('assets/images/intro/intro_2.png');

  /// File path: assets/images/intro/intro_3.png
  AssetGenImage get intro3 =>
      const AssetGenImage('assets/images/intro/intro_3.png');

  /// List of all assets
  List<AssetGenImage> get values => [intro1, intro2, intro3];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
