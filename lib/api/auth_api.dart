import 'package:quiz_juman/config/user_preferences.dart';

import '../config/token.dart';
import 'api_url.dart';
import 'my_network_manager.dart';

class AuthApi {
  Future<Map<dynamic, dynamic>?> login(String otp, String mobile) async {
    const url = AppUrl.login;
    try {
      final extractedData = await MyNetworkManager.postData(
          url, {"OTP": otp, "mobile": mobile}, {});
      if (extractedData != null) {
        if (extractedData['success']) {
          UserPreferences().saveToken(token: extractedData['token']);
        }
        return extractedData;
      }
    } catch (error) {
      //return false;
    }
    return null;
  }

  Future<bool> postName(String name) async {
    const url = AppUrl.postName;
    var token = await Token.getTokens();
    try {
      final extractedData = await MyNetworkManager.postData(url, {
        "name": name
      }, {
        'Authorization': 'Bearer $token',
      });
      if (extractedData != null) {
        if (extractedData['success']) {
          UserPreferences().saveName(name: name);
          UserPreferences().saveMobile(mobile: extractedData['mobile']);
        }
      }
      return extractedData!['success'];
    } catch (error) {
      rethrow;
    }
  }
}
