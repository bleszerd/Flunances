import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flutter/material.dart';

import 'hero_text.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 80, 40, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeroText(),
          SizedBox(
            height: 32,
          ),
          Text(
            "The smart finance app to keep your records stats and keep track of your wallet.",
            style: TextStyle(
              color: AppColors.textPrimary,
              height: 1.5,
              fontSize: AppFontSize.normal,
            ),
          ),
        ],
      ),
    );
  }
}
