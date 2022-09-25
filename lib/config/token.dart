import 'package:quiz_juman/config/user_preferences.dart';

class Token {
  static dynamic getTokens() async {
    var token = await UserPreferences().getToken();
    return token;
  }
}
