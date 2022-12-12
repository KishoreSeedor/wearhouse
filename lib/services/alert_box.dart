import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wearhouse/const/color.dart';
import 'package:wearhouse/models/quality_check_questions.dart';
import 'package:wearhouse/models/quality_value.dart';
import 'package:wearhouse/screens/PickOrder/pick_orders_line.dart';
import 'package:wearhouse/screens/PickOrder/scanSerial.dart';
import 'package:wearhouse/services/api/recive_api.dart';
import 'package:wearhouse/services/bar_code_scaner.dart';
import 'package:wearhouse/services/bar_code_scanner_alert.dart';

String? value;

List<QualityQuestions?> questionDetailis = [];

class QuestionGet {
  Future<List<QualityQuestions>?> questionGet() async {
    List<QualityQuestions> newValue;
    for (var i = 0; i < questionDetailis.length; i++) {
      print("questionidlength--->${questionDetailis.length}");

      questionId = questionDetailis[i]!.id.toString();
      question = questionDetailis[i]!.questions.toString();
    }
  }
}

String? questionId;
String? chooseValue;
String? feedBackValueText;
String? question;
int index = 0;

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: value.toString(),
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
    // const DropdownMenuItem(
    //     enabled: true,
    //     value: "Average",
    //     child: Text(
    //       "Average",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //     )),
    // const DropdownMenuItem(
    //     value: "Bad",
    //     child: Text(
    //       "Bad",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //     )),
    // const DropdownMenuItem(
    //     value: "Yes",
    //     child: Text(
    //       "Yes",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //     )),
    // const DropdownMenuItem(
    //     value: "No",
    //     child: Text(
    //       "No",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //     )),
  ];
  return menuItems;
}

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
                        style: const TextStyle(
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

  void confirmBox({
    required BuildContext context,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: CustomColor.white,
                  insetPadding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Text(
                            "Confirmation Required",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
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
                                    child: const Text(
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
                                    onPressed: () {
                                      Navigator.pop(context);
                                      globalAlertBox.successBox(
                                          context: context);
                                    },
                                    child: const Text(
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
                  insetPadding: const EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
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
                                      child: const Center(
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
    String adding = 1 as String;

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
                    insetPadding: const EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: CustomColor.graybox,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
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
                                  const Text(
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
      {required BuildContext context,
      required String barcode,
      required String text,
      required String subTitleText}) async {
    bool show = false;

    final TextEditingController controller = TextEditingController();
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SafeArea(
                        child: Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: CustomColor.white,
                          insetPadding: const EdgeInsets.all(10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: CustomColor.graybox,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        text,
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
                                    subTitleText,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            decoration: BoxDecoration(
                                                color: CustomColor.graybox,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                "assets/images/back_image.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          ".",
                                          style: TextStyle(fontSize: 50),
                                          textAlign: TextAlign.center,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                ),
              ),
            );
          });
    });
  }

  Future<void> qualityChecker(
      {required BuildContext context,
      required Future<List<QualityQuestionsValue?>> qualityFuture,
      required String barcode,
      required TextEditingController? feedBackValue,
      required String userId}) async {
    bool show = false;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: CustomColor.white,
                    insetPadding: const EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: FutureBuilder<List<QualityQuestions?>>(
                          future: RecieveAPI()
                              .qualityCheck(context: context, userId: userId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              questionDetailis = snapshot.data!;
                              print(questionDetailis.toString() +
                                  'questionsssss');
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: CustomColor.graybox,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.05),
                                          child: const Text(
                                            "Quality Check",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: CustomColor.blackcolor),
                                          ),
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
                                  // Expanded(
                                  //   flex: 4,
                                  //   child: ListView.builder(
                                  //     scrollDirection: Axis.vertical,
                                  //     shrinkWrap: true,
                                  //     itemCount: snapshot.data!.length,
                                  //     itemBuilder: (context, index) {
                                  //       questionId = snapshot.data![index]!.id;
                                  //       return Padding(
                                  //         padding: EdgeInsets.only(
                                  //             top: height * 0.03,
                                  //             left: width * 0.03,
                                  //             right: width * 0.03),
                                  //         child: Container(
                                  //           height: height * 0.13,
                                  //           child: Column(
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment.start,
                                  //                 crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                 children: [
                                  //                   Text(
                                  //                     '${index.toString().replaceFirst(0.toString(), 1.toString())}.',
                                  //                     style: TextStyle(
                                  //                         fontSize: 18),
                                  //                   ),
                                  //                   Expanded(
                                  //                     flex: 3,
                                  //                     child: Text(
                                  //                       snapshot.data![index]!
                                  //                           .questions
                                  //                           .toString(),
                                  //                       style: const TextStyle(
                                  //                           fontSize: 18,
                                  //                           fontWeight:
                                  //                               FontWeight
                                  //                                   .bold),
                                  //                       overflow: TextOverflow
                                  //                           .visible,
                                  //                     ),
                                  //                   )
                                  //                 ],
                                  //               ),
                                  //               Padding(
                                  //                 padding: EdgeInsets.only(
                                  //                     left: width * 0.5,
                                  //                     right: width * 0.08),
                                  //                 child: DropdownItemState(
                                  //                   feedBack: feedBackValueText
                                  //                       .toString(),
                                  //                   questionId:
                                  //                       questionId.toString(),
                                  //                   answerId:
                                  //                       chooseValue.toString(),
                                  //                   height: height,
                                  //                   userId: userId,
                                  //                   data: qualityFuture,
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          question.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: CustomColor.blackcolor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: height * 0.05,
                                              vertical: width * 0.1),
                                          child: DropdownItemState(
                                              userId: userId,
                                              data: qualityFuture,
                                              answerId: userId),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Feedback",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.01),
                                          child: SizedBox(
                                            //height: cann't be changeable,
                                            width: width * 0.85,
                                            child: TextField(
                                              controller: feedBackValue,
                                              onSubmitted: (e) {
                                                feedBackValue!.text = e;
                                                feedBackValueText =
                                                    feedBackValue.text;
                                              },
                                              textAlign: TextAlign.start,
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  hintStyle: const TextStyle(
                                                      color: CustomColor
                                                          .dimensionColor,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  hintText: feedBackValueText,
                                                  fillColor: Colors.white70),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  NextScreen()
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: CustomColor.yellow,
                                ),
                              );
                            }
                          }),
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}

class NextScreen extends StatefulWidget {
  const NextScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.18,
                decoration: BoxDecoration(
                    color: CustomColor.graybox,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/back_image.png",
                  ),
                ),
              ),
            ),
            const Text(
              ".",
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                  color: CustomColor.boxGreen,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      RecieveAPI().qualityValueGet(
                          context: context,
                          feedBack: feedBackValueText.toString(),
                          questionId: questionId.toString(),
                          answerId: chooseValue.toString());
                      feedBackValueText = "";
                      questionDetailis[index]!.questions + 1.toString();
                      print(
                          "11111--->${questionDetailis[index]!.questions.length + 1}");
                    });
                  },
                  child: Image.asset(
                    "assets/images/tick.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownItemState extends StatefulWidget {
  String userId;

  String answerId;
  Future<List<QualityQuestionsValue?>>? data;
  DropdownItemState({
    super.key,
    required this.userId,
    required this.data,
    required this.answerId,
  });

  @override
  State<DropdownItemState> createState() => _DropdownItemStateState();
}

class _DropdownItemStateState extends State<DropdownItemState> {
  // _DropdownItemStateState() {
  //   selectedValue = prodectList[0].toString();
  // }
  TextEditingController? qualityValueController;

  String? selectedValue;
  String? qualityValue;
  // List<QualityQuestionsValue?> prodectList = [];
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    qualityValueController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    qualityValueController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: _dropdownFormKey,
      child: FutureBuilder<List<QualityQuestionsValue?>>(
          future: widget.data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DropdownButtonFormField(
                  isExpanded: true,
                  icon: const Visibility(
                      visible: false, child: Icon(Icons.arrow_downward)),
                  hint: const Text(
                    "choose",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.blackcolor),
                  ),
                  alignment: Alignment.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      fillColor: CustomColor.appbarColor,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: height * 0.001),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),

                  // value: snapshot.data![index]!.questions,
                  items: snapshot.data!
                      .map((e) => DropdownMenuItem<String>(
                            enabled: true,
                            value: e!.id,
                            child: Text(
                              e.questions,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (newValue) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      selectedValue = newValue;
                      print("selectedValue-->$selectedValue");
                    });
                  });
            } else {
              return Container();
            }
          }),
    );
  }
}
