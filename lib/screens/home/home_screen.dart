import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moniepoint_shop/app_data.dart';
import 'package:moniepoint_shop/screens/home/home_controller.dart';
import 'package:moniepoint_shop/shared_widgets/badge_icon_widget.dart';
import 'package:moniepoint_shop/shared_widgets/grid_widget.dart';
import 'package:moniepoint_shop/styles/moniepoint_theme.dart';
import 'package:moniepoint_shop/styles/styles.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            buildCustomScroll(context),
            buildTopSearchArea(context),
          ],
        ),
      ),
    );
  }

  Widget buildCustomScroll(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverAppBar(
          expandedHeight: 220.0.h,
          flexibleSpace: buildTopSlider(context),
        ),
        SliverAppBar(
          pinned: true,
          expandedHeight: 50.h,
          flexibleSpace: buildServicesSlider(context),
        ),
        SliverAppBar(
          pinned: true,
          flexibleSpace: buildProductTitleRow(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: MyGridView(items: productList),
        ),
      ],
    );
  }

  Widget buildTopSearchArea(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.only(
        left: 18.w,
        right: 18.w,
        top: MediaQuery.of(context).padding.top,
      ),
      color: Colors.white.withOpacity(controller.opacity.value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Iconsax.search_normal,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          BadgeIconWidget(
            icon: Iconsax.bag_2,
            label: '1',
            onPressed: () {},
          ),
          BadgeIconWidget(
            icon: Iconsax.message_text,
            label: '9+',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildTopSlider(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: alternateColor,
        image: DecorationImage(
          image: AssetImage('assets/images/1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container buildServicesSlider(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      color: Colors.amber,
    );
  }

  Widget buildProductTitleRow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Best Sale Product',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'See more',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: MonieTheme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
