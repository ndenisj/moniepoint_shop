import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moniepoint_shop/services/logger.dart';
import 'package:moniepoint_shop/services/route_service.dart';
import 'package:moniepoint_shop/styles/moniepoint_theme.dart';
import 'package:moniepoint_shop/styles/styles.dart';

import 'app_binding.dart';
import 'app_links.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  Logger logger = Logger('_MoniepointApp');
  final showApp = false.obs;
  Bindings bindings = AppBinding();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    logger.log('building app');

    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) => GetMaterialApp(
        title: 'Moniepoint Store',
        debugShowCheckedModeBanner: false,
        initialBinding: bindings,
        theme: lightTheme(context),
        themeMode: ThemeMode.dark,
        initialRoute: AppLinks.mainNavigation,
        getPages: AppRoutes.pages,
        navigatorObservers: [RouteService(), RouteService().routeObserver],
        onInit: () {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        },
        defaultTransition: Transition.fade,
      ),
    );
  }
}
