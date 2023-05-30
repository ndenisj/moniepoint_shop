import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moniepoint_shop/styles/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildTopSearchArea(context),
        ],
      ),
    );
  }

  Container buildTopSearchArea(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Iconsax.search_normal,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.bag_2),
            color: Colors.red,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.message_text),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
