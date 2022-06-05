import 'package:cached_network_image/cached_network_image.dart';
import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageHeaderTitle extends StatelessWidget {
  const PageHeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinearGradient profileImageGradient = LinearGradient(
      colors: [
        AppColors.brilhantSecondarySwatch.withOpacity(.5),
        AppColors.brilhantPrimarySwatch.withOpacity(.5),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );

    const LinearGradient borderImageGradient = LinearGradient(
      colors: [
        AppColors.brilhantSecondarySwatch,
        AppColors.brilhantPrimarySwatch,
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      alignment: Alignment.center,
      height: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.surfaceFocused,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 8),
            child: const Text(
              "Let's start",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.title,
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: borderImageGradient,
            ),
            child: Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.surface,
              ),
              padding: const EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: ShaderMask(
                  blendMode: BlendMode.color,
                  shaderCallback: (bounds) => profileImageGradient.createShader(
                    Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "https://github.com/bleszerd.png",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
