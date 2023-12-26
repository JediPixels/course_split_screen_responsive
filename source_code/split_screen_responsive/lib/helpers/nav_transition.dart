import 'package:flutter/material.dart';

class FadeTransitionRoute extends PageRouteBuilder {
  FadeTransitionRoute({required this.widget})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

  final Widget widget;
}
