import 'package:flutter/material.dart';
import 'package:quiz_juman/api/auth_api.dart';
import 'package:quiz_juman/config/user_preferences.dart';
import 'package:quiz_juman/ui/auth/login.dart';

import '../../../api/user_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var first = true;
  var future;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (first) {
      future = UserInfoApi().fetchAndSetUserInfo();
      first = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                ListTile(
                  leading: Text(snapshot.data!['name']),
                ),
                ListTile(
                  leading: Text(snapshot.data!['mobile']),
                ),
                ListTile(
                  onTap: () {
                    UserPreferences().removeUser();
                    Navigator.of(context).pushNamed(Login.routeName);
                  },
                  leading: Text('LOGOUT'),
                ),
              ],
            );
          }
          return Container();
        });
  }
}
