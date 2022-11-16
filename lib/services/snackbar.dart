import 'package:flutter/material.dart';
import 'package:wearhouse/const/color.dart';

class GlobalSnackbar {
  genarelSnackbar({required BuildContext context, required String text}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 40,
          child: Center(
            child: Text(text),
          ),
        ),
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: CustomColor.orangecolor,
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  successsnackbar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SizedBox(
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: CustomColor.yellow,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
    ));
  }
}