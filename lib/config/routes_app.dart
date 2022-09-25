import 'package:quiz_juman/ui/auth/login.dart';

class RoutesApp {
  static routesApp() {
    return {
      '/': (ctx) => Login(),
      // BottomTabsScreen.routeName: (ctx) => BottomTabsScreen(),
    };
  }
}
