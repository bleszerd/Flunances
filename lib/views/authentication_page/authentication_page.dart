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
  late AnimationController opacityController;

  late Animation<double> opacityAnimation;
  bool animationComplete = false;

  @override
  Widget build(BuildContext context) {
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
          animationComplete = true;
        }
      });

    opacityController.forward();

    return Scaffold(
      body: AnimatedBuilder(
        animation: opacityAnimation,
        builder: (context, child) => Stack(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
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
            ),
            !animationComplete
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
    );
  }
}
