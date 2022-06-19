import 'package:cached_network_image/cached_network_image.dart';
import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageHeaderTitle extends StatelessWidget {
  final bool showOptions;
  final bool showProfilePicture;
  final String title;

  const PageHeaderTitle({
    Key? key,
    this.showOptions = true,
    this.showProfilePicture = true,
    required this.title,
  }) : super(key: key);

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
          showOptions
              ? IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "drawable/icons/header_option_icon.svg",
                    color: AppColors.white,
                    width: 20,
                    height: 20,
                  ),
                )
              : Container(),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.title,
              ),
            ),
          ),
          showProfilePicture
              ? Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: borderImageGradient,
                  ),
                  child: Container(
                    width: 49,
                    height: 49,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.surface,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ShaderMask(
                        blendMode: BlendMode.color,
                        shaderCallback: (bounds) =>
                            profileImageGradient.createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "https://github.com/bleszerd.png",
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
