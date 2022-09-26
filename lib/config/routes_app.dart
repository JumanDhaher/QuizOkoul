import 'package:quiz_juman/ui/auth/login.dart';
import 'package:quiz_juman/ui/auth/name.dart';
import 'package:quiz_juman/ui/auth/otp_auth.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import '../ui/splash_screen/splash_screen.dart';

class RoutesApp {
  static routesApp() {
    return {
      '/': (ctx) => SplashScreens(),
      OtpScreen.routeName: (ctx) => OtpScreen(),
      NameScreen.routeName: (ctx) => NameScreen(),
      TabScreen.routeName: (ctx) => TabScreen(),
      Login.routeName: (ctx) => Login()
    };
  }
}
