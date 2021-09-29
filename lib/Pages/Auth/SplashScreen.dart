import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vatanim_app/Pages/Auth/LoginPage.dart';
import 'package:vatanim_app/Utility/Decorations.dart';
import 'package:vatanim_app/Utility/Utility.dart';
import 'package:vatanim_app/Utility/AssetPath.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      return Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getSize(context),
        height: MediaQuery.of(context).size.height,
        decoration: decorationRadialGradientBackground,
        child: Center(
          child: Image.asset(iconPathLogoStrokeVatanim, 
            color: Colors.white,
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
