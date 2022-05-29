import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flutter/material.dart';

import 'hero_text.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 80, 40, 32),
          child: HeroText(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 32),
          child: Text(
            "Our smart finance app will keep you records stats and track",
            style: TextStyle(
              color: AppColors.textPrimary,
              height: 1.5,
              fontSize: AppFontSize.normal,
            ),
          ),
        ),
      ],
    );
  }
}
