import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

class AlertTop {
  static void alertTop(BuildContext context, String description,
      [Color color = Colors.black45, Color colorText = Colors.black]) {
    CherryToast(
      icon: Icons.error,
      themeColor: Colors.pink,
      title: Text(''),
      displayTitle: false,
      description: Text(description),
      toastPosition: Position.top,
      animationDuration: Duration(milliseconds: 1000),
      autoDismiss: true,
    ).show(context);
  }
}
