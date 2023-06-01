import 'package:flutter/material.dart';
import 'package:moniepoint_shop/styles/moniepoint_theme.dart';
import 'package:moniepoint_shop/styles/styles.dart';

class BadgeIconWidget extends StatelessWidget {
  const BadgeIconWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final Function() onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Badge(
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(label),
        ),
        backgroundColor: alternateColor,
        child: Icon(icon),
      ),
      color: MonieTheme.of(context).primaryText,
    );
  }
}
