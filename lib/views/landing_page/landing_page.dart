import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/widgets/circular_button.dart';
import 'package:flunances/views/authentication_page/authentication_page.dart';
import 'package:flunances/shared/widgets/fade_animated_page_transition.dart';
import 'package:flunances/views/landing_page/components/hero_header.dart';
import 'package:flunances/views/landing_page/components/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController buttonScaleController;
  late AnimationController arrowOpacityController;

  late Animation<double> buttonScaleAnimation;
  late Animation<double> arrowOpacityAnimation;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    buttonScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.push(
              context,
              FadeAnimatedPageTransition(
                route: const AuthenticationPage(),
                page: Container(),
              ),
            );
            Timer(
              const Duration(milliseconds: 300),
              () {
                buttonScaleController.reset();
              },
            );
          }
        },
      );

    arrowOpacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Timer(
              const Duration(milliseconds: 800),
              () {
                arrowOpacityController.reset();
              },
            );
          }
        },
      );

    buttonScaleAnimation = Tween<double>(begin: 1.0, end: 30.0).animate(
      CurvedAnimation(
        parent: buttonScaleController,
        curve: Curves.easeInOutQuart,
      ),
    );
    arrowOpacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(arrowOpacityController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: const [
                HeroHeader(),
                HeroImage(),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: AvatarGlow(
                glowColor: AppColors.primarySwatch,
                endRadius: 120,
                repeatPauseDuration: const Duration(seconds: 2),
                duration: const Duration(milliseconds: 2000),
                child: AnimatedBuilder(
                  animation: buttonScaleAnimation,
                  builder: (context, child) => Stack(
                    children: [
                      Transform.scale(
                        scale: buttonScaleAnimation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primarySwatch,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(left: 5, top: 5),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: arrowOpacityAnimation,
                        builder: (context, child) => Opacity(
                          opacity: arrowOpacityAnimation.value,
                          child: CircularButton(
                            onTap: () {
                              buttonScaleController.forward();
                              arrowOpacityController.forward();
                            },
                            iconSize: 30,
                            size: 64,
                            rippleColor:
                                AppColors.brilhantPrimarySwatch.withOpacity(.3),
                            bgColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
