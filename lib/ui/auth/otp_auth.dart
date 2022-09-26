import 'package:flutter/material.dart';
import 'package:quiz_juman/api/auth_api.dart';
import 'package:quiz_juman/ui/auth/name.dart';

import '../../config/alert_top.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/Otp-screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final controllerText = TextEditingController();
  String mobile = '';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mobile = ModalRoute.of(context)?.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              const Text('OTP auth'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controllerText,
                  keyboardType: TextInputType.number,
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
                if (controllerText.text != '' && mobile != '') {
                  AuthApi().login(controllerText.text, mobile).then((value) {
                    if (value) {
                      Navigator.of(context).pushNamed(
                        NameScreen.routeName,
                      );
                    } else {
                      AlertTop.alertTop(context, 'error');
                    }
                  });
                } else {
                  AlertTop.alertTop(context, 'error');
                }
              },
              child: Text('Start'))
        ],
      ),
    );
  }
}
