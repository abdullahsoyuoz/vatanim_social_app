import 'package:flutter/material.dart';
import 'package:vatanim_app/Pages/Auth/SplashScreen.dart';
import 'package:vatanim_app/Utility/Utility.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppStarter(),
  ));
}

class AppStarter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: WithoutGlow(), child: SplashScreen());
  }
}
