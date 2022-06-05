import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Color rippleColor;
  final Color bgColor;
  final double size;
  final double iconSize;
  final VoidCallback onTap;

  const CircularButton({
    Key? key,
    required this.rippleColor,
    required this.bgColor,
    required this.size,
    required this.iconSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: AppColors.primarySwatch,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(360),
          overlayColor: MaterialStateProperty.all(rippleColor),
          onTap: onTap,
          child: Icon(
            Icons.arrow_forward_rounded,
            size: iconSize,
            color: AppColors.surfaceFocused,
          ),
        ),
      ),
    );
  }
}
