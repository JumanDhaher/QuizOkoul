import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/globals.dart' as global;

class UserPreferences {
  Future<bool> saveName({
    required String name,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("name", name);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("name");
    return name;
  }

  void updateName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    prefs.setString("name", name);
  }

  Future<bool> saveMobile({
    required String mobile,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("mobile", mobile);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<String?> getMobile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mobile = prefs.getString("mobile");
    return mobile;
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("token");
    Box<Map<dynamic, dynamic>> box = Hive.box("score");
    await box.clear();
  }

  Future<bool> saveToken({
    required String token,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("token", token);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token") ?? '';
    global.token = prefs.getString("token");

    return token;
  }
}
