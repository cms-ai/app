import 'package:app/gen/export.dart';

enum BottomNavBarEnum {
  home,
  transition,
  add,
  budget,
  profile,
}

extension BottomNavBarEnumExt on BottomNavBarEnum {
  ///
  /// get icon for navbar item(only using svg icons)
  ///
  String handleGetIcon() {
    switch (this) {
      case BottomNavBarEnum.home:
        return Assets.icons.bottomNavBar.icHome.path;
      case BottomNavBarEnum.transition:
        return Assets.icons.bottomNavBar.icTransaction.path;
      case BottomNavBarEnum.add:
        return Assets.icons.bottomNavBar.icAdd.path;
      case BottomNavBarEnum.budget:
        return Assets.icons.bottomNavBar.icBudget.path;
      case BottomNavBarEnum.profile:
        return Assets.icons.bottomNavBar.icProfile.path;
    }
  }
}
