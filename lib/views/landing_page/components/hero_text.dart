import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flunances/views/landing_page/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';

class HeroText extends StatelessWidget {
  final LinearGradient textGradient = const LinearGradient(
    colors: [
      AppColors.primarySwatch,
      AppColors.secondarySwatch,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final TextStyle textStyle = const TextStyle(
    fontSize: AppFontSize.hero,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.1,
  );

  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          text: Text.rich(
            const TextSpan(
              text: "Set your\n",
              children: [
                TextSpan(
                  text: "Financial\n",
                  children: [
                    TextSpan(
                      text: 'Goals',
                    )
                  ],
                )
              ],
            ),
            style: textStyle,
          ),
          gradient: textGradient,
        ),
      ],
    );
  }
}
