import 'package:flutter/material.dart';
import 'package:wearhouse/screens/PutAway/bottom_widget2.dart';
import 'package:wearhouse/screens/PutAway/put_away_orders_line.dart';

import '../../const/color.dart';
import '../Receive/received_page_container.dart';

class PutAwayOrdersSelect extends StatefulWidget {
  const PutAwayOrdersSelect({super.key});

  @override
  State<PutAwayOrdersSelect> createState() => _PutAwayOrdersSelectState();
}

bool _visible = false;

class _PutAwayOrdersSelectState extends State<PutAwayOrdersSelect> {
  String? barcode;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: _visible ? const Size(0, 400) : const Size(0, 0),
          child: Container(
            height: _visible ? height * 0.48 : height * 0,
            decoration: const BoxDecoration(
                color: Color(0xFF706E6E),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.15,
                    bottom: height * 0.005),
                child: const Text(
                  "Location",
                  style: TextStyle(
                      color: CustomColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: SizedBox(
                  height: height * 0.05,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CustomColor.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.15,
                    bottom: height * 0.005),
                child: const Text(
                  "Exp,Rec,Date",
                  style: TextStyle(
                      color: CustomColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: SizedBox(
                  height: height * 0.05,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CustomColor.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: CustomColor.homepageBgColor, width: 2)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.15,
                    bottom: height * 0.005),
                child: const Text(
                  "PO Number",
                  style: TextStyle(
                      color: CustomColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: SizedBox(
                  height: height * 0.05,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: CustomColor.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.15,
                    bottom: height * 0.005),
                child: const Text(
                  "Assigned User ID",
                  style: TextStyle(
                      color: CustomColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: SizedBox(
                  height: height * 0.05,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset("assets/images/dropdown.png"),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: CustomColor.white, width: 2)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.03, left: width * 0.42),
                    child: SizedBox(
                      height: height * 0.035,
                      width: width * 0.26,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: CustomColor.whiteGreen,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "RESET",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.03,
                    ),
                    child: SizedBox(
                      height: height * 0.035,
                      width: width * 0.26,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: const Color(0xFFEDFDDD),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "APPLY",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        backgroundColor: CustomColor.darkwhite,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Image.asset(
              "assets/images/putawaylogo.png",
            ),
            onPressed: () {},
          ),
        ),
        title: const Text(
          "Put Away Orders",
          style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/images/fillter.png",
            ),
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.04,
                  bottom: height * 0.02,
                  left: width * 0.04),
              child: SizedBox(
                height: height * 0.06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/Barcode2.png"),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "1145",
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Expanded(
                      flex: 5,
                      child: IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: EdgeInsets.all(height * 0.004),
                            child: Image.asset("assets/images/close.png"),
                          )),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 3,
              color: CustomColor.yellow,
            ),
            Container(
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: CustomColor.lightPink,
              ),
              child: ReceivedContainer(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PutAwayOrdersLine()));
                    _visible = false;
                  });
                },
                height: height,
                width: width,
                companyName: "Kishore",
                createDate: "11.11.22",
                origin: "India",
                displayName: "Kishore",
              ),
            ),
          ],
        ),
      ),
    );
  }
}