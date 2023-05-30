import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logger.dart';

RouteService get routeService => Get.find();

class RouteService extends NavigatorObserver {
  Logger logger = Logger('RouteService');
  RouteObserver<Route> routeObserver = RouteObserver<Route>();

  static final RouteService _cache = new RouteService._internal();
  Route? currentRoute;

  factory RouteService() {
    return _cache;
  }

  RouteService._internal() {
    init();
  }

  void init() {
    logger.log('intialiazing route service...');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    String name = route.settings.name ?? "";
    logger.log('route pushed: $name');
    currentRoute = route;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.log('route removed...');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.log('route popped...');
  }

  void goBack() {
    Get.back();
  }

  Future<dynamic>? gotoRoute(String route, {Object? arguments}) {
    logger.log('navigating to $route');
    return Get.toNamed(route, arguments: arguments);
  }

  Future<dynamic>? offAllNamed(String route, {Object? arguments}) {
    logger.log('getting off all routes and navigating to $route');
    return Get.offAllNamed(route, arguments: arguments);
  }

  Future<dynamic>? openScreen(Widget page,
      {bool fullscreenDialog = false, dynamic arguments}) {
    logger.log('opening screen');
    return Get.to(() => page,
        fullscreenDialog: fullscreenDialog, arguments: arguments);
  }
}
