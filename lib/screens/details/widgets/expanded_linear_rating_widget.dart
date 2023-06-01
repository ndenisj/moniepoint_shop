import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_shop/styles/styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExpandedLinearRating extends StatelessWidget {
  ExpandedLinearRating({
    super.key,
    required this.percent,
    required this.rating,
    required this.ratingNo,
  });

  String rating;
  String ratingNo;
  double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 5),
        Text(
          rating,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 14.sp,
              ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: LinearPercentIndicator(
            barRadius: const Radius.circular(5),
            padding: EdgeInsets.zero,
            animation: true,
            animationDuration: 1000,
            width: 135.w,
            lineHeight: 10,
            percent: percent,
            backgroundColor: Colors.grey.withOpacity(0.5),
            progressColor: moniePrimaryColor,
          ),
        ),
        SizedBox(width: 5),
        Text(
          ratingNo,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
        ),
      ],
    );
  }
}
