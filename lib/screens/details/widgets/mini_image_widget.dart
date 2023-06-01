import 'package:flutter/material.dart';
import 'package:moniepoint_shop/styles/styles.dart';

class MiniImageWidget extends StatelessWidget {
  const MiniImageWidget({super.key, required this.image, this.size = 40.0});

  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: monieSecondaryColor,
          width: 0.5,
        ),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
