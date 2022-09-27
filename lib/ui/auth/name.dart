import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import '../../api/auth_api.dart';
import '../../config/alert_top.dart';

class NameScreen extends StatefulWidget {
  static const routeName = '/name-screen';

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final controllerText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              const Text('Name'),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: controllerText,
                  keyboardType: TextInputType.text,
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
                  AuthApi().postName(controllerText.text).then((value) {
                    if (value) {
                      Navigator.of(context).pushNamed(
                        TabScreen.routeName,
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
