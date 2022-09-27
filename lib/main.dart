import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_juman/config/routes_app.dart';
import 'package:quiz_juman/ui/auth/login.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import 'config/user_preferences.dart';
import 'config/globals.dart' as global;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Map<dynamic, dynamic>>("score");

  await UserPreferences().getToken();
  (global.token == null)
      ? global.route = Login.routeName
      : global.route = TabScreen.routeName;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: RoutesApp.routesApp(),
    );
  }
}
