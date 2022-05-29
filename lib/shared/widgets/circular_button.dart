import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color splashColor;
  final double splashOpacity;
  final Alignment alignment;
  final Color backgroundColor;
  final Icon icon;

  const CircularButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.backgroundColor,
    this.splashColor = Colors.white,
    this.splashOpacity = 1,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.longestSide;

    return Container(
      alignment: alignment,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size),
        splashColor: splashColor.withOpacity(splashOpacity),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size),
            color: backgroundColor,
          ),
          child: icon,
        ),
      ),
    );
  }
}
