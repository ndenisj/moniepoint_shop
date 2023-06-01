import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moniepoint_shop/styles/styles.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'main_navigation_controller.dart';

class MainNavigationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavigationController());
  }
}

class MainNavigationScreen extends GetView<MainNavigationController> {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.persistentTabController,
      screens: controller.buildScreens(),
      items: controller.navBarsItems(context),
      confineInSafeArea: true,
      // navBarHeight: 60.h,
      backgroundColor: white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
