import 'package:flutter/material.dart';
import 'package:wearhouse/const/color.dart';
import 'package:wearhouse/services/alert_box.dart';

class AlertTest extends StatelessWidget {
  const AlertTest({super.key, required this.barcode});
  final String barcode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Center(
          child: TextButton(
              onPressed: () {
                GlobalAlertBox().successBox(context: context);
              },
              child: Text("Enter")),
        )
      ]),
      backgroundColor: CustomColor.white,
    );
  }
}
