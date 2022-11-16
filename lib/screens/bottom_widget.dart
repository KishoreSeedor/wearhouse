import 'package:flutter/material.dart';

import '../const/color.dart';
import '../services/bar_code_scaner.dart';

class BottomWidgets extends StatelessWidget {
  const BottomWidgets({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.09),
          child: SizedBox(
            height: height * 0.04,
            child: FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BarcodeScannerPage()));
              },
              backgroundColor: CustomColor.yellow,
              foregroundColor: Colors.black,
              label: Column(
                children: [
                  Image.asset(
                    "assets/images/scanner.png",
                    width: width * 0.09,
                    height: height * 0.06,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.55,
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: () {},
          backgroundColor: CustomColor.darkwhite,
          foregroundColor: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: Image.asset(
                  "assets/images/Category.png",
                  width: width * 0.08,
                  height: height * 0.05,
                ),
              ),
              const Text(
                "Menu",
                style: TextStyle(fontSize: 8),
              )
            ],
          ),
        ),
      ],
    );
  }
}
