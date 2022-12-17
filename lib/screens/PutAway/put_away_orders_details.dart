import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warehouse/screens/PutAway/bottom_widget_putaway.dart';
import 'package:warehouse/screens/PutAway/put_away_provider/put_away_provider.dart';

import '../../const/color.dart';

class PutAwayOrdersLine extends StatefulWidget {
  const PutAwayOrdersLine({super.key});

  @override
  State<PutAwayOrdersLine> createState() => _PutAwayOrdersLineState();
}

class _PutAwayOrdersLineState extends State<PutAwayOrdersLine> {
  String? barcode;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final orderLine = Provider.of<PutAwayProvider>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: CustomColor.darkwhite,
            leading: Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: IconButton(
                icon: Image.asset(
                  "assets/images/putawaylogo.png",
                  scale: 0.9,
                ),
                onPressed: () {},
              ),
            ),
            title: const Text(
              "Put Away Order Lines",
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
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: unrelated_type_equality_checks

                      Text(
                        "1",
                        style: const TextStyle(
                            color: CustomColor.blackcolor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/2",
                        style: TextStyle(
                            color: CustomColor.blackcolor,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.04, left: width * 0.06),
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Order No :",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "1196",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.01),
                        child: Row(
                          children: [
                            const Text(
                              "Sender    :",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Kishore",
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
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
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          setState(() {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         OrederLinePage2(
                            //       barcode: widget.barcode,
                            //       value:
                            //           snapshot.data![index],
                            //     ),
                            //   ),
                            // );
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(17),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1145",
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
                                          "Medicine",
                                          overflow: TextOverflow.fade,
                                          textAlign: TextAlign.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "1",
                                          style: const TextStyle(
                                              color: CustomColor.blackcolor2,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "3",
                                          style: const TextStyle(
                                              color: CustomColor.blackcolor2,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
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
                                    color: CustomColor.yellow,
                                    borderRadius: BorderRadius.circular(3)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 5,
                separatorBuilder: (BuildContext context, int itemCount) {
                  return const Divider(
                    thickness: 3,
                    color: CustomColor.yellow,
                  );
                },
              ),
            ),
          ]),
        ),
        backgroundColor: CustomColor.backgroundColor,
        floatingActionButton: PutAwayOrderLineScannerCamera(
          barcode: barcode,
        ));
  }
}
