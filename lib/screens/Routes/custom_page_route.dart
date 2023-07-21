import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPageRouteLeft extends PageRouteBuilder {
  final AxisDirection direction;
  final Widget child;

  CustomPageRouteLeft({
    required this.child,
    this.direction = AxisDirection.left,
  }) : super(
          transitionDuration: Duration(milliseconds: 250),
          reverseTransitionDuration: Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOfsset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  getBeginOfsset() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1);
      case AxisDirection.down:
        return Offset(0, -1);
      case AxisDirection.right:
        return Offset(-1, 0);
      case AxisDirection.left:
        return Offset(1, 0);
    }
  }
}
