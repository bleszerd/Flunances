import 'dart:async';

import 'package:flunances/shared/theme/app_colors.dart';
import 'package:flunances/shared/widgets/page_header_title.dart';
import 'package:flunances/views/authentication_page/components/sign_in_area.dart';

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
  List<Color> backgroundColors = [
    AppColors.surface,
    AppColors.surfaceFocused,
  ];
  int animationIndex = 0;
  double animationRange = 0;

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

  void configureBackgroundAnimation() {
    void updateState() {
      setState(() {
        animationIndex += 1;
      });
    }

    // First build
    Future.delayed(const Duration(seconds: 0), () {
      updateState();
    });

    Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        updateState();
      },
    );
  }

  AlignmentGeometry getBackgroundRadiusCenter(int condition) {
    if (condition % 2 == 0) {
      return Alignment.topCenter;
    } else {
      return Alignment.bottomCenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    int animCondition = animationIndex % 2;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
        animation: opacityAnimation,
        builder: (context, child) => AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 3500),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColors[animCondition],
                animCondition == 0 ? backgroundColors[1] : backgroundColors[0],
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
                    Flexible(
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
