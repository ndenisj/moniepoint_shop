import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moniepoint_shop/styles/styles.dart';

import 'rating_option_widget.dart';

class SingleReviewWidget extends StatelessWidget {
  const SingleReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/2.jpg'),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Eren Y****r',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star, size: 18, color: Colors.amber),
                  const SizedBox(width: 3),
                  Text(
                    '5.0',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.more),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              RatingOption(label: 'Product in good condition'),
              RatingOption(label: 'Very fast delivery'),
              RatingOption(label: 'Fast seller response'),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'According to my expectation. This is the best. Thank you',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: lightPrimaryText,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 5)),
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                icon: const Icon(Iconsax.like_1),
                label: const Text('Helpful?'),
              ),
              Text(
                'Yesterday',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
