import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wearhouse/models/orders_line_model.dart';
import 'package:wearhouse/models/recived_details_model.dart';
import 'package:wearhouse/screens/receive_orders_line.dart';
import 'package:wearhouse/services/alert_box.dart';
import 'package:wearhouse/services/api/recive_api.dart';
import 'package:wearhouse/services/bar_code_scaner.dart';
import 'package:wearhouse/services/snackbar.dart';

import '../const/color.dart';

import 'bottom_widget.dart';

// ignore: must_be_immutable
class OrederLinePage2 extends StatefulWidget {
  final String barcode;
  final OrderLine value;
  const OrederLinePage2(
      {super.key, required this.barcode, required this.value});

  @override
  State<OrederLinePage2> createState() => _OrederLinePage2State();
}

class _OrederLinePage2State extends State<OrederLinePage2> {
  TextEditingController? quantityController;

  @override
  void initState() {
    quantityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    quantityController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalAlertBox globalAlertBox = GlobalAlertBox();
    final data = Provider.of<RecieveAPI>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: CustomColor.darkwhite,
            leading: Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: IconButton(
                icon: Image.asset(
                  "assets/images/recivedbox.png",
                  scale: 0.9,
                ),
                onPressed: () {},
              ),
            ),
            title: const Text(
              "Receive Order Lines",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold),
            ),
            actions: []),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColor.gray200,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.value.productId,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColor.blackcolor2),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: height * 0.04,
                                    ),
                                    child: Text(
                                      widget.value.productName,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.blackcolor2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Expanded(
                          //   flex: 17,
                          //   child: Container(
                          //     height: height * 0.15,
                          //     width: width * 0.001,
                          //     decoration: BoxDecoration(
                          //         border: Border.all(
                          //             color: CustomColor
                          //                 .blackcolor,
                          //             width: width *
                          //                 0.004),
                          //         borderRadius:
                          //             BorderRadius
                          //                 .circular(
                          //                     10),
                          //         color: CustomColor
                          //             .backgroundColor),
                          //     child: Image.asset(
                          //       "assets/images/speaker.png",
                          //       fit: BoxFit.contain,
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: width * 0.2,
                          // ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      quantityController!.text,
                                      style: const TextStyle(
                                          color: CustomColor.blackcolor2,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "/${widget.value.productOnQty}",
                                      style: const TextStyle(
                                          color: CustomColor.blackcolor2,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                const Text(
                                  "PCS",
                                  style: TextStyle(
                                      color: CustomColor.blackcolor2,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),

                          Container(
                            height: height * 0.015,
                            width: width * 0.05,
                            decoration: BoxDecoration(
                                color: int.parse(widget.value.quantityDone) == 0
                                    ? CustomColor.yellow
                                    : int.parse(widget.value.quantityDone) <
                                            int.parse(widget.value.productOnQty)
                                        ? CustomColor.orangecolor
                                        : int.parse(widget
                                                    .value.quantityDone) ==
                                                int.parse(
                                                    widget.value.productOnQty)
                                            ? CustomColor.greencolor
                                            : CustomColor.yellow,
                                borderRadius: BorderRadius.circular(3)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.all(10),
                      // margin: EdgeInsets.symmetric(horizontal: width * 0.002),
                      height: height * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            )
                          ]),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.06,
                              width: width,

                              // ignore: sort_child_properties_last
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: height * 0.01, left: width * 0.05),
                                    child: const Text(
                                      "Enter Quantity",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 8,
                                    child: Text(""),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Padding(
                                      padding: EdgeInsets.all(height * 0.004),
                                      child: Image.asset(
                                          "assets/images/close.png"),
                                    ),
                                  ),
                                ],
                              ),

                              color: CustomColor.darkwhite,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.02),
                              child: TextField(
                                decoration: InputDecoration(
                                  // helperText:
                                  //     widget.value.productOnQty.toString(),
                                  hintText:
                                      widget.value.productOnQty.toString(),
                                  // labelText:
                                  //     widget.value.productOnQty.toString(),
                                ),
                                controller: quantityController,
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                onSubmitted: (e) {
                                  setState(() {
                                    if (int.parse(quantityController!.text) <=
                                        int.parse(widget.value.productOnQty)) {
                                      print(
                                          "lengthQty--> ${int.parse(widget.value.quantityDone)}");
                                      print(
                                          "lengthDone--> ${int.parse(widget.value.productOnQty)}");

                                      RecieveAPI().orderLineQuantity(
                                          quantity: e,
                                          productId: widget.value.productId,
                                          userid:
                                              widget.value.userid.toString(),
                                          context: context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrdersLinePage1(
                                                      barcode:
                                                          widget.barcode)));
                                      RecieveAPI().orderLine(
                                          context: context,
                                          domain: widget.barcode);
                                    } else {
                                      globalAlertBox.topAlertBox(
                                          context: context,
                                          text: "Enter Valid Details");
                                    }
                                  });
                                },
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: width * 0.8,
                                  child: const Text(
                                    "Enter the quantity to complete registration",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: CustomColor.grayword,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        backgroundColor: CustomColor.backgroundColor,
      ),
    );
  }
}
