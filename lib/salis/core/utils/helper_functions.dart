import 'package:flutter/material.dart';

class HelperFunctions {
  static routeReplacdTo(Widget to, BuildContext context) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => to,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(2.0, 0.0);
          const end = Offset.zero;

          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  static routePushTo(Widget to, BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => to,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(2.0, 0.0);
          const end = Offset.zero;

          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
