import 'package:get/get.dart';
import 'package:moniepoint_shop/screens/home/home_controller.dart';
import 'package:moniepoint_shop/services/logger.dart';
import 'package:moniepoint_shop/services/route_service.dart';

class AppBinding extends Bindings {
  Logger logger = Logger('AppBinding');

  @override
  void dependencies() {
    logger.log('loading dependencies');

    Get.put(RouteService());

    Get.put(HomeController());
  }
}
