import 'package:flutter/material.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import '../../api/auth_api.dart';
import '../../config/alert_top.dart';
import '../../config/empty_state.dart';

class NameScreen extends StatefulWidget {
  static const routeName = '/name-screen';

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final controllerText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const EmptyStateSvg(
                  image: 'assets/images/name.svg',
                ),
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
                      label: Text('Enter your name'),
                      hintText: 'Enter your name',
                      contentPadding: EdgeInsets.only(
                          top: 1.0, left: 13.0, right: 13.0, bottom: 1.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (controllerText.text != '') {
                    AuthApi().postName(controllerText.text).then((value) {
                      if (value) {
                        Navigator.of(context).pushNamed(
                          TabScreen.routeName,
                        );
                      } else {
                        AlertTop.alertTop(context, 'wrtie corrcet name');
                      }
                    });
                  } else {
                    AlertTop.alertTop(context, 'The name cannot be empty');
                  }
                },
                child: const Text('Done'))
          ],
        ),
      ),
    );
  }
}
