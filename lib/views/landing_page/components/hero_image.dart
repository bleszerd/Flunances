import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Transform.translate(
        offset: const Offset(0, 115),
      ).transform,
      alignment: Alignment.bottomRight,
      decoration: const BoxDecoration(),
      child: SvgPicture.asset(
        "drawable/images/hero_landing_image.svg",
        semanticsLabel: 'Hero decoration image',
        width: 280,
      ),
    );
  }
}
