import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/widgets/page_header_title.dart';
import 'package:flunances/views/authentication_page/components/sign_in_area.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with TickerProviderStateMixin {
  //Open page animation
  late AnimationController opacityController;
  late Animation<double> opacityAnimation;
  bool openAnimationComplete = false;

  //Background animation
  final Color topColor = AppColors.brilhantPrimarySwatch;
  final Color bottomColor = AppColors.brilhantSecondarySwatch;

  @override
  void initState() {
    super.initState();

    configureOpenPageAnimation();
    configureBackgroundAnimation();
  }

  void configureOpenPageAnimation() {
    opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    opacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: opacityController,
        curve: Curves.easeInOutCirc,
      ),
    )..addListener(() {
        if (opacityAnimation.isCompleted) {
          openAnimationComplete = true;
        }
      });

    opacityController.forward();
  }

  void configureBackgroundAnimation() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: opacityAnimation,
        builder: (context, child) => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.surfaceFocused,
                AppColors.surface,
              ],
            ),
          ),
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    PageHeaderTitle(
                      title: "Let's start",
                      showOptions: false,
                      showProfilePicture: false,
                    ),
                    Expanded(
                      child: SignInArea(),
                    ),
                  ],
                ),
              ),
              !openAnimationComplete
                  ? Opacity(
                      opacity: opacityAnimation.value,
                      child: Container(
                        color: AppColors.primarySwatch,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
