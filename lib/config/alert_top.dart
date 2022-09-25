import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class AlertTop {
  static void alertTop(BuildContext context, String description,
      [Color color = Colors.black45, Color colorText = Colors.black]) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      boxShadows: [
        BoxShadow(
          color: color,
          //offset: Offset(3, 3),
          //  blurRadius: 4,
        ),
      ],
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white70,
      messageText: Text(
        description,
        style: TextStyle(color: colorText),
      ),
      margin: const EdgeInsets.all(20),
    )..show(context);
  }
}
