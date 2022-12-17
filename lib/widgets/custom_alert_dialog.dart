import 'package:flutter/material.dart';

class CustomAlertDialog {
  customAlertDialog(
      {required BuildContext context,
      required String title,
      required String content,
      bool twoButton = false}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              twoButton
                  ? ElevatedButton(onPressed: () {}, child: Text('Cancel'))
                  : Container(),
              ElevatedButton(onPressed: () {}, child: Text('Ok'))
            ],
          );
        });
  }
}
