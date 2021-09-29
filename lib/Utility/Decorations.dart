import 'package:flutter/material.dart';
import 'package:vatanim_app/Utility/Colors.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';

BoxDecoration decorationRadialGradientBackground = BoxDecoration(
    gradient: RadialGradient(
        colors: [appColorRedGradiantLighter, appColorRedGradiantDarker],
        radius: 1));

BoxDecoration decorationBackgroundRed = BoxDecoration(
    image:
        DecorationImage(image: AssetImage(backgroundRed), fit: BoxFit.cover));

BoxDecoration decorationBackgroundWhite = BoxDecoration(
    image:
        DecorationImage(image: AssetImage(backgroundWhite), fit: BoxFit.cover));
