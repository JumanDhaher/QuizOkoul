import 'package:flutter/material.dart';
import 'package:quiz_juman/config/routes_app.dart';
import 'package:quiz_juman/ui/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: RoutesApp.routesApp(),
      //home: const Login(),
    );
  }
}
