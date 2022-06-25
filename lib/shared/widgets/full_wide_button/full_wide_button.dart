import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/theme/font_size.dart';
import 'package:flutter/material.dart';

class FullWideButton extends StatefulWidget {
  const FullWideButton({Key? key}) : super(key: key);

  @override
  State<FullWideButton> createState() => _FullWideButtonState();
}

class _FullWideButtonState extends State<FullWideButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            // border: Border.all(
            //   style: BorderStyle.solid,
            //   width: 1,
            //   color: AppColors.secondarySwatch,
            // ),
          ),
          child: RawMaterialButton(
            elevation: 26,
            splashColor: AppColors.brilhantSecondarySwatchFocused,
            fillColor: AppColors.brilhantSecondarySwatch,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 27.5,
                horizontal: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
        const Text(
          "Sign-in",
          style: TextStyle(
            fontSize: AppFontSize.normal,
            fontWeight: FontWeight.w800,
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}
