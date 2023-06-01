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
          expandedHeight: 100.h,
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
      height: 260.h,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: mainSliderList.length,
            onPageChanged: (int index) {
              controller.currentTopPageIndex.value = index;
            },
            itemBuilder: (context, index) {
              final slide = mainSliderList[index];
              return Container(
                height: 220.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(slide),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment(1, -0.2),
            child: Container(
              height: 20,
              width: 70.w,
              child: buildTopIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Container buildServicesSlider(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      color: white,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: 2,
              onPageChanged: (int index) {
                controller.currentServicePageIndex.value = index;
              },
              itemBuilder: (context, index) {
                return Container(
                  height: 50.h,
                  width: 120.0,
                  decoration: BoxDecoration(),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: serviceList
                        .map(
                          (service) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(service.icon),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                service.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 5.0),
          buildServiceIndicator(),
        ],
      ),
    );
  }

  Widget buildServiceIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(2, (int index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          width: controller.currentServicePageIndex == index ? 15.w : 4.0.w,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: controller.currentServicePageIndex == index
                ? BorderRadius.circular(5)
                : BorderRadius.circular(50),
            color: controller.currentServicePageIndex == index
                ? monieSecondaryColor
                : Colors.grey,
          ),
        );
      }),
    );
  }

  Widget buildTopIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (int index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          width: controller.currentTopPageIndex == index ? 15.w : 4.0.w,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: controller.currentTopPageIndex == index
                ? BorderRadius.circular(5)
                : BorderRadius.circular(50),
            color: controller.currentTopPageIndex == index
                ? monieSecondaryColor
                : Colors.grey,
          ),
        );
      }),
    );
  }

  Widget buildProductTitleRow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      color: lightSecondaryBackgroundColor,
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
