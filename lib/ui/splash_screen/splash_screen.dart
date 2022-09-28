//import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_juman/ui/auth/login.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import '../../config/empty_state.dart';
import '../../config/globals.dart' as global;

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

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

  var start = true;
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        start = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return start
        ? const EmptyStateSvg(
            image: 'assets/images/splash_screen.svg',
          )
        : Container(
            //  duration: 100,
            //splash: Container(
            child: widgetScreen());
    // ),
    //   nextScreen: widgetScreen(),
    // splashTransition: SplashTransition.rotationTransition,
    // pageTransitionType: PageTransitionType.fade,
    // backgroundColor: Theme.of(context).primaryColor);
  }
}
