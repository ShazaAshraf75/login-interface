import 'package:flutter/material.dart';

Route animateToRoute(Widget page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
            opacity: animation,
            child: child,
          ));
}
