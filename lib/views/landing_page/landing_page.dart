import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/widgets/circular_button.dart';
import 'package:flunances/views/landing_page/components/hero_header.dart';
import 'package:flunances/views/landing_page/components/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.surface,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MaterialStateProperty<Color> materialStateColorTransparent =
        MaterialStateProperty.all(Colors.transparent);

    ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: materialStateColorTransparent,
      shadowColor: materialStateColorTransparent,
      overlayColor: materialStateColorTransparent,
      foregroundColor: materialStateColorTransparent,
      surfaceTintColor: materialStateColorTransparent,
    );

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Expanded(
          child: Stack(
            children: [
              const HeroHeader(),
              const HeroImage(),
              ElevatedButton(
                onPressed: () {},
                style: buttonStyle,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                  child: CircularButton(
                    alignment: Alignment.bottomCenter,
                    backgroundColor: AppColors.primarySwatch,
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.surfaceFocused,
                    ),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
