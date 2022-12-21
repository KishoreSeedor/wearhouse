import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class MyCustomAlertDialog {
  showCustomAlertdialog({
    required BuildContext context,
    required String title,
    required String subtitle,
    bool button = false,
    required Function() onTapOkButt,
    Function()? onTapCancelButt,
  }) async {
    return Platform.isIOS
        ? showCupertinoDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: <Widget>[
                if (button == true)
                  CupertinoDialogAction(
                    child: const Text('Cancel'),
                    onPressed: () => onTapCancelButt!(),
                  ),
                CupertinoDialogAction(
                  child: const Text('Ok'),
                  onPressed: () => onTapOkButt(),
                ),
              ],
            ),
          )
        : showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text(title),
                  content: Text(subtitle),
                  actions: <Widget>[
                    if (button == true)
                      ElevatedButton(
                        child: const Text('Cancel'),
                        onPressed: () => onTapCancelButt!(),
                      ),
                    ElevatedButton(
                      child: const Text('Ok'),
                      onPressed: () => onTapOkButt(),
                    ),
                  ]);
            });
  }
}
