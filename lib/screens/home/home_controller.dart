import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moniepoint_shop/services/logger.dart';

class HomeController extends GetxController {
  Logger logger = Logger('HomeController');
  late ScrollController scrollController;
  final PageController pageController = PageController(initialPage: 0);

  RxInt currentServicePageIndex = 0.obs;
  RxInt currentTopPageIndex = 0.obs;
  RxDouble opacity = 0.0.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.offset == 0) {
      opacity.value = 0;
    } else if (scrollController.offset >= 200) {
      opacity.value = 1;
    } else if (scrollController.offset >= 0 && scrollController.offset <= 200) {
      opacity.value = 0 + (scrollController.offset / 200);
    }
  }
}
