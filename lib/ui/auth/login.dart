import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';
import 'package:quiz_juman/config/alert_top.dart';
import 'package:quiz_juman/ui/auth/otp_auth.dart';

class Login extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controllerText = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('QuizU'),
          Column(
            children: [
              const Text('Mobile'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controllerText,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 5,
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    )),
                    contentPadding: EdgeInsets.only(
                        top: 1.0, left: 13.0, right: 13.0, bottom: 1.0),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () async {
                if (controllerText.text != '') {
                  // Validate
                  bool isValid = await PhoneNumberUtil()
                      .validate('+966${controllerText.text}');
                  print(isValid);
                  if (isValid) {
                    Navigator.of(context).pushNamed(OtpScreen.routeName,
                        arguments: controllerText.text);
                  } else {
                    AlertTop.alertTop(context, 'must enter correct mobile');
                  }
                } else {
                  AlertTop.alertTop(context, 'must enter your mobile');
                }
              },
              child: const Text('Start'))
        ],
      ),
    );
  }
}
