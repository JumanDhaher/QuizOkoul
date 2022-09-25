import 'package:quiz_juman/ui/auth/login.dart';
import 'package:quiz_juman/ui/auth/name.dart';
import 'package:quiz_juman/ui/auth/otp_auth.dart';

class RoutesApp {
  static routesApp() {
    return {
      '/': (ctx) => Login(),
      OtpScreen.routeName: (ctx) => OtpScreen(),
      NameScreen.routeName: (ctx) => NameScreen(),
    };
  }
}
