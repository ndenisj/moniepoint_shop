import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moniepoint_shop/screens/home/home_screen.dart';
import 'package:moniepoint_shop/services/logger.dart';
import 'package:moniepoint_shop/styles/moniepoint_theme.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainNavigationController extends GetxController {
  Logger logger = Logger('MainNavigationController');

  late PersistentTabController persistentTabController;
  late bool hideNavBar;

  MainNavigationController() {
    init();
  }

  void init() {
    logger.log('Controller initialized');
    persistentTabController = PersistentTabController(initialIndex: 0);
    hideNavBar = false;
    load();
  }

  void load() async {
    logger.log('loading...');
  }

  List<Widget> buildScreens() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems(context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.home_15),
        inactiveIcon: const Icon(Iconsax.home),
        iconSize: 22.sp,
        title: "Home",
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
        activeColorPrimary: MonieTheme.of(context).primaryColor!,
        inactiveColorPrimary: MonieTheme.of(context).secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.ticket4),
        inactiveIcon: const Icon(Iconsax.ticket4),
        iconSize: 22.sp,
        title: "Voucer",
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
        activeColorPrimary: MonieTheme.of(context).primaryColor!,
        inactiveColorPrimary: MonieTheme.of(context).secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.wallet),
        inactiveIcon: const Icon(Iconsax.wallet_14),
        iconSize: 22.sp,
        title: "Wallet",
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
        activeColorPrimary: MonieTheme.of(context).primaryColor!,
        inactiveColorPrimary: MonieTheme.of(context).secondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.setting),
        inactiveIcon: const Icon(Iconsax.setting),
        iconSize: 22.sp,
        title: "Settings",
        textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
        activeColorPrimary: MonieTheme.of(context).primaryColor!,
        inactiveColorPrimary: MonieTheme.of(context).secondaryColor,
      ),
    ];
  }

  @override
  void dispose() {
    logger.debug('disposing of controller...');
    super.dispose();
  }
}
