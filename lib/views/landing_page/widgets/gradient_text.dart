import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final Text text;
  final Gradient gradient;

  const GradientText({Key? key, required this.text, required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTRB(0, 0, bounds.width - bounds.width / 2,
            bounds.height - bounds.height / 2),
      ),
      child: text,
    );
  }
}
