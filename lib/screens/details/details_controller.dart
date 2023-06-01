import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moniepoint_shop/models/product_model.dart';
import 'package:moniepoint_shop/services/logger.dart';

class DetailsController extends GetxController {
  Logger logger = Logger('DetailsController');
  Product? product;
  RxString mainImage = ''.obs;
  RxDouble containerHeight = 0.0.obs;
  RxString selectedReviews = 'Popular'.obs;

  @override
  void onInit() {
    logger.log('Controller initialized');
    super.onInit();
    load();
  }

  load() {
    logger.log('loadinf dependencies...');
    product = Get.arguments;
    mainImage.value = product!.images!.first;
  }

  changeImage(int index) {
    mainImage.value = product!.images![index];
  }

  void toggleContainerHeight() {
    containerHeight.value = containerHeight.value == 0.0 ? 1400.0.h : 0.0;
  }
}
