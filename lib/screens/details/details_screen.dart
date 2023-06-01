import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moniepoint_shop/app_data.dart';
import 'package:moniepoint_shop/screens/details/details_controller.dart';
import 'package:moniepoint_shop/shared_widgets/badge_icon_widget.dart';
import 'package:moniepoint_shop/shared_widgets/product_widget.dart';
import 'package:moniepoint_shop/shared_widgets/unordered_list_widget.dart';
import 'package:moniepoint_shop/styles/styles.dart';

import 'widgets/expanded_linear_rating_widget.dart';
import 'widgets/mini_image_widget.dart';
import 'widgets/single_review_widget.dart';

class DetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController());
  }
}

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  final DetailsController controller = Get.find();

  late TabController _tabController;
  // screen animation
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;
  late Animation<double> _opacityAnimation;
  //

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _positionAnimation = Tween<double>(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    // Start the animation when the screen is loaded
    _animationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.heart5),
            color: alternateColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.share),
          ),
          BadgeIconWidget(
            icon: Iconsax.bag_2,
            label: '1',
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Obx(
            () => Stack(
              children: [
                Positioned(
                  top: _positionAnimation.value,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          buildImageSelectionArea(context),
                          buildStoreNameArea(context),
                          const SizedBox(height: 10),
                          buildProductName(context),
                          const SizedBox(height: 10),
                          buildRatingRow(context),
                          const SizedBox(height: 20),
                          buildTabBar(context),
                          buildTabBarViewArea(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: moniePrimaryColor,
      unselectedLabelColor: Colors.grey,
      labelColor: moniePrimaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        const Tab(text: 'About Item'),
        const Tab(text: 'Reviews'),
      ],
    );
  }

  Widget buildTabBarViewArea(BuildContext context) {
    return SizedBox(
      height: controller.containerHeight.value > 0
          ? MediaQuery.of(context).size.height + 950.0.h
          : 400.h,
      child: TabBarView(
        controller: _tabController,
        children: [
          buiildAboutItemTab(),
          buildReviewsTab(),
        ],
      ),
    );
  }

  Column buildReviewsTab() {
    return const Column(
      children: [
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget buiildAboutItemTab() {
    return SizedBox(
      height: 1200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildAboutItem('Brand: ', 'ChArmkpR'),
                    const SizedBox(height: 10),
                    buildAboutItem('Color: ', 'Aprikot'),
                    const SizedBox(height: 10),
                    buildAboutItem('Condition: ', 'New'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildAboutItem('Category: ', 'Casual Shirt'),
                    const SizedBox(height: 10),
                    buildAboutItem('Material: ', 'Polyster'),
                    const SizedBox(height: 10),
                    buildAboutItem('Heavy: ', '200 g'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const Divider(),
          const SizedBox(height: 20.0),
          Text(
            'Description:',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          const SizedBox(height: 10.0),
          UnorderedList([
            "Patch pocket on left chest with classic cotton fabic.",
            "Classic button down shirt.",
            "Long-sleeve dress shirt in classic fit"
          ]),
          const SizedBox(height: 10.0),
          Text(
            'Chat with us if the is anything you need to ask about the product :)',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: controller.toggleContainerHeight,
            child: Text(
              controller.containerHeight.value > 0 ? 'See less' : 'See more',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: moniePrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 10.0),
          buildSeeMoreContainer(),
        ],
      ),
    );
  }

  AnimatedContainer buildSeeMoreContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: controller.containerHeight.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 20.0),
          Text(
            'Shipping Information:',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          const SizedBox(height: 10.0),
          buildAboutItem('Delivery: ', 'Shipping from Jakarta, Indonesia'),
          const SizedBox(height: 10.0),
          buildAboutItem('Shipping: ', 'Free International Shipping'),
          const SizedBox(height: 10.0),
          buildAboutItem('Arrive: ', 'Estimated arrival on 25-oct-2025'),
          const SizedBox(height: 20.0),
          const Divider(),
          const SizedBox(height: 20.0),
          Text(
            'Seller Information:',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          const SizedBox(height: 10.0),
          buildSellerInformation(),
          const SizedBox(height: 20.0),
          const Divider(),
          const SizedBox(height: 20.0),
          Text(
            'Reviews & Ratings:',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          const SizedBox(height: 10.0),
          buildReviewAndRating(context),
          const SizedBox(height: 20.0),
          Text(
            'Reviews with images & videos',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          buildReviewWithImages(context),
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 20.0),
          buildTopReviewsRow(context),
          const SizedBox(height: 20.0),
          const SingleReviewWidget(),
          const SizedBox(height: 20.0),
          buildPagination(context),
          const SizedBox(height: 40.0),
          buildlRecommendedTitleRow(context),
          const SizedBox(height: 20.0),
          buildRecommendedItems(context),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget buildRecommendedItems(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Row(
        children: [
          Expanded(
            child: ProductWidget(
              onTap: () {},
              product: productList[0],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ProductWidget(
              onTap: () {},
              product: productList[1],
            ),
          ),
        ],
      ),
    );
  }

  Row buildlRecommendedTitleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommendation',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
        ),
        Text(
          'See more',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: moniePrimaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Row buildPagination(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: const Icon(
                    Iconsax.arrow_left_2,
                  ),
                ),
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: moniePrimaryColor,
                      fontSize: 14.sp,
                    ),
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
              ),
              Text(
                '3',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
              ),
              Text(
                '....',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Iconsax.arrow_right_3,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 60.w),
        Text(
          'See more',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: moniePrimaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Row buildTopReviewsRow(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Reviews',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
            ),
            Text(
              'Showing 3 of 2.5k+ reviews',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 10.sp,
                  ),
            ),
          ],
        ),
        SizedBox(width: 50.w),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButton<String>(
              underline: const SizedBox.shrink(),
              isExpanded: true,
              value: controller.selectedReviews.value,
              onChanged: (newValue) {
                controller.selectedReviews.value = newValue!;
              },
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: lightPrimaryText,
                    fontWeight: FontWeight.bold,
                  ),
              items: [
                const DropdownMenuItem(
                  value: 'Popular',
                  child: Text('Popular'),
                ),
                const DropdownMenuItem(
                  value: 'Not Popular',
                  child: Text('Not Popular'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  SizedBox buildReviewWithImages(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        children: controller.product!.images!
            .map((image) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MiniImageWidget(
                    image: image,
                    size: 50,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Row buildSellerInformation() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/3.jpg'),
          radius: 30,
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thrifting_Store',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'Active 5 Min ago | 96.5% Positive Feedback',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: moniePrimaryColor),
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.shop),
                      SizedBox(width: 10),
                      Text('Visit Store'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildReviewAndRating(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: '4.9',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 44.sp,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: '/5.0',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
            RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star,
              onRatingChanged: (value) => print(''),
              initialRating: 4.5,
              size: 22,
            ),
            Text(
              '2.3k+ Reviews',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            children: [
              ExpandedLinearRating(
                rating: '5',
                ratingNo: '1.5k',
                percent: 0.8,
              ),
              ExpandedLinearRating(
                rating: '4',
                ratingNo: '1.5k',
                percent: 0.6,
              ),
              ExpandedLinearRating(
                rating: '3',
                ratingNo: '1.5k',
                percent: 0.4,
              ),
              ExpandedLinearRating(
                rating: '2',
                ratingNo: '1.5k',
                percent: 0.2,
              ),
              ExpandedLinearRating(
                rating: '1',
                ratingNo: '1.5k',
                percent: 0.1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildAboutItem(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Colors.grey,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
        ),
      ],
    );
  }

  Container buildImageSelectionArea(BuildContext context) {
    return Container(
      height: 320.h,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightFormBorderColor,
        image: DecorationImage(
            image: AssetImage(controller.mainImage.value),
            fit: BoxFit.cover,
            alignment: Alignment.center),
      ),
      child: Row(
        children: [
          Column(
            children: controller.product!.images!.map((image) {
              var index = controller.product!.images!.indexOf(image);
              return InkWell(
                onTap: () => controller.changeImage(index),
                child: MiniImageWidget(
                  image: image,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Row buildStoreNameArea(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Iconsax.shop,
          color: Colors.grey,
        ),
        const SizedBox(width: 5),
        Text(
          'tokobaju.id',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  Text buildProductName(BuildContext context) {
    return Text(
      controller.product!.name!,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Row buildRatingRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow.shade800,
              size: 14.sp,
            ),
            const SizedBox(width: 3),
            Text(
              '4.9 Ratings',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        Text(
          '.',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.grey,
              ),
        ),
        Text(
          '2.3k+ Review',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '.',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.grey,
              ),
        ),
        Text(
          '2.9k+ Sold',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      height: 90.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Price',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              Text(
                '\$18.00',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: moniePrimaryColor,
                    ),
              ),
            ],
          ),
          SizedBox(width: 60.w),
          Expanded(
            child: buildButtonRow(context),
          ),
        ],
      ),
    );
  }

  Row buildButtonRow(context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 55.h,
            decoration: const BoxDecoration(
              color: moniePrimaryColor,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.bag_2,
                  color: white,
                ),
                const SizedBox(width: 10),
                Text(
                  '1',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: white),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 55.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(8),
                ),
                color: monieSecondaryColor,
              ),
              alignment: Alignment.center,
              child: Text(
                'Buy Now',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
