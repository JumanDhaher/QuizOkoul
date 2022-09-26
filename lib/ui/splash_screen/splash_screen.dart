import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:quiz_juman/config/user_preferences.dart';
import 'package:quiz_juman/ui/auth/login.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import '../../config/globals.dart' as global;

class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  widgetScreen() {
    if (global.route == Login.routeName) {
      return Login();
    } else {
      return TabScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 100,
        splash: Container(
          child: Text('QUIZ'),
        ),
        nextScreen: widgetScreen(),
        splashTransition: SplashTransition.rotationTransition,
        // pageTransitionType: PageTransitionType.fade,
        backgroundColor: Theme.of(context).primaryColor);
  }
}
