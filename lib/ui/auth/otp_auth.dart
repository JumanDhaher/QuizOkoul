import 'package:flutter/material.dart';
import 'package:quiz_juman/api/auth_api.dart';
import 'package:quiz_juman/ui/auth/name.dart';
import 'package:quiz_juman/ui/home/tab_screen.dart';

import '../../config/alert_top.dart';
import '../../config/empty_state.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/Otp-screen';

  const OtpScreen({super.key});

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
                  image: 'assets/images/otp.svg',
                ),
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
                      label: Text('Enter OTP code'),
                      hintText: 'Enter OTP code',
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
                  if (controllerText.text != '' && mobile != '') {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    AuthApi().login(controllerText.text, mobile).then((value) {
                      if (value != null) {
                        if (value['success']) {
                          if (value['name'] == null) {
                            Navigator.of(context).pushNamed(
                              NameScreen.routeName,
                            );
                          } else {
                            Navigator.of(context).pushNamed(
                              TabScreen.routeName,
                            );
                          }
                        }
                      } else {
                        AlertTop.alertTop(context, 'OTP code is Not corrext');
                      }
                    });
                  } else {
                    AlertTop.alertTop(context, 'The OTP code cannot be empty');
                  }
                },
                child: const Text('Check'))
          ],
        ),
      ),
    );
  }
}
