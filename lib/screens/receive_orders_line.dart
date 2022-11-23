import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:wearhouse/models/orders_line_model.dart';
import 'package:wearhouse/models/recived_details_model.dart';
import 'package:wearhouse/screens/bottom_widget.dart';
import 'package:wearhouse/services/api/recive_api.dart';
import 'package:wearhouse/services/bar_code_scaner.dart';
import 'package:wearhouse/services/barcode_scanner2.dart';

import '../const/color.dart';
import 'received_order_line2.dart';

List<OrderLine> globalorderLine = [];

class OrdersLinePage1 extends StatefulWidget {
  final String barcode;
  const OrdersLinePage1({super.key, required this.barcode});

  @override
  State<OrdersLinePage1> createState() => _OrdersLinePage1State();
}

class _OrdersLinePage1State extends State<OrdersLinePage1> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<RecieveAPI>(context, listen: false)
  //         .particularOrders(context: context, domain: widget.barcode);
  //   });
  // }

  // bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    // var data = true;

    TextEditingController _value = TextEditingController();

    final orders = Provider.of<RecieveAPI>(context, listen: false);

    final detail = Provider.of<RecieveAPI>(context, listen: false)
        .particularOrders(context: context, domain: widget.barcode);

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
            actions: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: const Text(
                    "1/4",
                    style: TextStyle(
                        color: CustomColor.blackcolor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
        body: FutureBuilder<RecievedDetails?>(
            future: RecieveAPI()
                .particularOrders(context: context, domain: widget.barcode),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // var visible = true;
                // print(visible);
                // showInfo() {
                //   setState(() {
                //     visible = !visible;
                //   });
                // }

                return SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.04, left: width * 0.06),
                          child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Order No :",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        snapshot.data!.displayName,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: height * 0.01),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Sender    :",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            snapshot.data!.companyName,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        const Divider(
                          thickness: 3,
                          color: CustomColor.yellow,
                        ),
                        Expanded(
                          child: FutureBuilder<List<OrderLine>>(
                              future: orders.orderLine(
                                  context: context, domain: widget.barcode),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  globalorderLine = snapshot.data!;

                                  print(snapshot.data!.length);
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      print(snapshot.data!.length);
                                      print(globalorderLine);

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrederLinePage2(
                                                      barcode: widget.barcode,
                                                      value:
                                                          snapshot.data![index],
                                                    ),
                                                  ),
                                                );
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(13),
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: CustomColor.gray200,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.03),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          snapshot.data![index]
                                                              .productId,
                                                          style: const TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: CustomColor
                                                                  .blackcolor2),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.03,
                                                        ),
                                                        Container(
                                                          height: height * 0.07,
                                                          width: width * 0.55,
                                                          child: Text(
                                                            snapshot
                                                                .data![index]
                                                                .productName,
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: CustomColor
                                                                    .blackcolor2),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.01,
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
                                                  SizedBox(
                                                    width: width * 0.06,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            _value.text,
                                                            style: const TextStyle(
                                                                color: CustomColor
                                                                    .blackcolor2,
                                                                fontSize: 23,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "/${snapshot.data![index].productOnQty}",
                                                            style: const TextStyle(
                                                                color: CustomColor
                                                                    .blackcolor2,
                                                                fontSize: 23,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.01,
                                                      ),
                                                      const Text(
                                                        "PCS",
                                                        style: TextStyle(
                                                            color: CustomColor
                                                                .blackcolor2,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Container(
                                                    height: height * 0.015,
                                                    width: width * 0.05,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            CustomColor.yellow,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount: snapshot.data!.length,
                                    separatorBuilder:
                                        (BuildContext context, int itemCount) {
                                      return const Divider(
                                        thickness: 3,
                                        color: CustomColor.yellow,
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        color: CustomColor.yellow),
                                  );
                                }
                              }),
                        ),
                        // SingleChildScrollView(
                        //   child: Container(
                        //     clipBehavior: Clip.hardEdge,
                        //     margin: const EdgeInsets.all(10),
                        //     // margin: EdgeInsets.symmetric(horizontal: width * 0.002),
                        //     height: height * 0.54,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //         color: CustomColor.white,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.3),
                        //             spreadRadius: 5,
                        //             blurRadius: 7,
                        //             offset: const Offset(0, 3),
                        //           )
                        //         ]),

                        //     child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children: [
                        //           Container(
                        //             height: height * 0.06,
                        //             width: width,

                        //             // ignore: sort_child_properties_last
                        //             child: Row(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.center,
                        //               children: [
                        //                 Padding(
                        //                   padding: EdgeInsets.only(
                        //                       top: height * 0.01,
                        //                       left: width * 0.05),
                        //                   child: const Text(
                        //                     "Enter Quantity",
                        //                     style: TextStyle(
                        //                         fontSize: 28,
                        //                         fontWeight: FontWeight.w500),
                        //                   ),
                        //                 ),
                        //                 const Expanded(
                        //                   flex: 8,
                        //                   child: Text(""),
                        //                 ),
                        //                 IconButton(
                        //                   onPressed: () {
                        //                     snapshot.data!.isVisible;
                        //                   },
                        //                   icon: Padding(
                        //                     padding:
                        //                         EdgeInsets.all(height * 0.004),
                        //                     child: Image.asset(
                        //                         "assets/images/close.png"),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),

                        //             color: CustomColor.darkwhite,
                        //           ),
                        //           Padding(
                        //             padding: EdgeInsets.symmetric(
                        //                 horizontal: width * 0.05,
                        //                 vertical: height * 0.02),
                        //             child: TextField(
                        //               controller: _value,
                        //               autofocus: true,
                        //               keyboardType: TextInputType.number,
                        //             ),
                        //           ),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.center,
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Container(
                        //                 width: width * 0.8,
                        //                 child: const Text(
                        //                   "Enter the quantity to complete registration",
                        //                   textAlign: TextAlign.center,
                        //                   style: TextStyle(
                        //                       color: CustomColor.grayword,
                        //                       fontSize: 22,
                        //                       fontWeight: FontWeight.w500),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           // const Text(
                        //           //   "registration",
                        //           //   style: TextStyle(
                        //           //       color: CustomColor.grayword,
                        //           //       fontSize: 22,
                        //           //       fontWeight: FontWeight.w500),
                        //           // ),
                        //         ]),
                        //   ),
                        // ),
                      ]),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: CustomColor.yellow),
                );
              }
            }),
        backgroundColor: CustomColor.backgroundColor,
        floatingActionButton: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.09),
              child: SizedBox(
                height: height * 0.04,
                child: FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => BarcodeScanner2(
                                barcode: widget.barcode,
                              )),
                    );
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
        ),
        // floatingActionButton: BarcodeScanner2(
        //   barcode: widget.barcode,
        // ))
      ),
    );
  }
}

class BottomWidget2 extends StatelessWidget {
  const BottomWidget2({
    super.key,
    required this.width,
    required this.height,
    required this.barcode,
  });

  final double width;
  final double height;

  final String barcode;
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => BarcodeScanner2(
                            barcode: barcode,
                          )),
                );
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

OrderLine? globallineDateTwo;
