import 'package:flutter/material.dart';

double getSize(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class WithoutGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
