import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:wearhouse/const/color.dart';
import 'package:wearhouse/services/bar_code_scanner_alert.dart';

class GlobalAlertBox {
  topAlertBox({required BuildContext context, required String text}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: CustomColor.yellow,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            color: CustomColor.blackcolor2,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void confirmBox({required BuildContext context}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: CustomColor.white,
                  insetPadding: EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Text(
                            "Confirmation Required",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                          child: Text(
                            "You have completed registrations on all orderlines. Do you want to post the order?",
                            style: TextStyle(
                                color: CustomColor.grayword,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: CustomColor.buttonBrown,
                                    borderRadius: BorderRadius.circular(12)),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "No",
                                      style: TextStyle(
                                          color: CustomColor.white,
                                          fontSize: 18),
                                    )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: CustomColor.buttonBrown,
                                    borderRadius: BorderRadius.circular(12)),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: CustomColor.white,
                                          fontSize: 18),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void successBox({required BuildContext context}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: CustomColor.white,
                  insetPadding: EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 18),
                            child: Text(
                              "Order posted succssfully",
                              style: TextStyle(
                                  color: CustomColor.grayword,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: CustomColor.buttonBrown,
                                      borderRadius: BorderRadius.circular(12)),
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          "CLOSE",
                                          style: TextStyle(
                                              color: CustomColor.white,
                                              fontSize: 20),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void scanBox({required BuildContext context, required String barcode}) {
    bool show = false;

    late final TextEditingController controller = TextEditingController();

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: CustomColor.white,
                    insetPadding: EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: CustomColor.graybox,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Enter delivery note number",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.blackcolor),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Image.asset(
                                        "assets/images/close.png",
                                      )),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 20, right: 20),
                              child: TextField(
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    show = true;
                                  } else {
                                    show = false;
                                  }
                                },
                                controller: controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    suffixText: "Scan Barcode",
                                    labelText: "Type or scan barcode",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    suffixIcon: show
                                        ? IconButton(
                                            iconSize: 50,
                                            icon: Image.asset(
                                                "assets/images/Barcode2.png"),
                                            onPressed: () {
                                              AlertBarcodeScanner(
                                                barcode: barcode,
                                              );
                                            },
                                          )
                                        : null,
                                    prefixIcon: show
                                        ? null
                                        : IconButton(
                                            iconSize: 50,
                                            icon: Image.asset(
                                                "assets/images/Barcode2.png"),
                                            onPressed: () {
                                              AlertBarcodeScanner(
                                                barcode: barcode,
                                              );
                                            },
                                          )),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      decoration: BoxDecoration(
                                          color: CustomColor.graybox,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/back_image.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ".",
                                    style: TextStyle(fontSize: 50),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        color: CustomColor.boxGreen,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/tick.png",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> scanSerialNumber(
      {required BuildContext context, required String barcode}) async {
    bool show = false;

    final TextEditingController controller = TextEditingController();
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SafeArea(
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: CustomColor.white,
                    insetPadding: EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: CustomColor.graybox,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Scan serial number",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.blackcolor),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(10),
                                //   child: IconButton(
                                //       onPressed: () {
                                //         Navigator.pop(context);
                                //       },
                                //       icon: Image.asset(
                                //         "assets/images/close.png",
                                //       )),
                                // )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 20, right: 20),
                              child: TextField(
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    show = true;
                                  } else {
                                    show = false;
                                  }
                                },
                                controller: controller,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    suffixText: "Scan Barcode",
                                    labelText: "Type or scan barcode",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    suffixIcon: show
                                        ? IconButton(
                                            iconSize: 50,
                                            icon: Image.asset(
                                                "assets/images/Barcode2.png"),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AlertBarcodeScanner(
                                                    barcode: barcode,
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : null,
                                    prefixIcon: show
                                        ? null
                                        : IconButton(
                                            iconSize: 50,
                                            icon: Image.asset(
                                                "assets/images/Barcode2.png"),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AlertBarcodeScanner(
                                                    barcode: barcode,
                                                  ),
                                                ),
                                              );
                                            },
                                          )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Scan the serial number for the item",
                              style: TextStyle(
                                  color: CustomColor.grayword,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      decoration: BoxDecoration(
                                          color: CustomColor.graybox,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/back_image.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ".",
                                    style: TextStyle(fontSize: 50),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    decoration: BoxDecoration(
                                        color: CustomColor.boxGreen,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/tick.png",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    });
  }
}
