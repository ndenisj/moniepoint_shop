import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_shop/styles/styles.dart';

class RatingOption extends StatelessWidget {
  const RatingOption({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: moniePrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: moniePrimaryColor, width: 2),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: moniePrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
      ),
    );
  }
}
