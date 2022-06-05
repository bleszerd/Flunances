import 'package:flutter/material.dart';

class FadeAnimatedPageTransition extends PageRouteBuilder {
  final Widget route;
  final Widget page;

  FadeAnimatedPageTransition({required this.route, required this.page})
      : super(
          pageBuilder: (context, animation, secondAnimation) => page,
          transitionsBuilder: (context, animation, secondAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
