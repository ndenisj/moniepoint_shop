import 'package:get/get.dart';
import 'package:moniepoint_shop/screens/main_navigation/main_navigation_screen.dart';

import 'app_links.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.mainNavigation,
      page: () => MainNavigationScreen(),
      binding: MainNavigationScreenBinding(),
    ),
  ];
}
