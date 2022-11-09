import 'package:flutter/material.dart';
import 'package:wearhouse/const/color.dart';

class ReceiveOrders extends StatefulWidget {
  const ReceiveOrders({super.key});

  @override
  State<ReceiveOrders> createState() => _ReceiveOrdersState();
}

bool _visible = false;

class _ReceiveOrdersState extends State<ReceiveOrders> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: _visible ? Size(0, 400) : Size(0, 0),
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
                child: Text(
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
                              BorderSide(color: Colors.black, width: 2)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.15,
                    bottom: height * 0.005),
                child: Text(
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
                          borderSide: BorderSide(
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
                child: Text(
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
                              BorderSide(color: Colors.black, width: 2)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.15,
                    bottom: height * 0.005),
                child: Text(
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
                          borderSide:
                              BorderSide(color: CustomColor.white, width: 2)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.03, left: width * 0.42),
                    child: Container(
                      height: height * 0.035,
                      width: width * 0.26,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: CustomColor.whiteGreen,
                          ),
                          onPressed: () {},
                          child: Container(
                            child: Text(
                              "RESET",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
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
                    child: Container(
                      height: height * 0.035,
                      width: width * 0.26,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Color(0xFFEDFDDD),
                          ),
                          onPressed: () {},
                          child: Container(
                            child: Text(
                              "APPLY",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
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
              "assets/images/recivedbox.png",
            ),
            onPressed: () {},
          ),
        ),
        title: const Text(
          "Receive Orders",
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
      body: ListView.separated(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColor.gray200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "WallkerHolland",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
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
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "2022-05-22",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "RE0000002",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Purchase Order",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int itemCount) {
          return Divider(
            thickness: 2,
            color: CustomColor.yellow,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: CustomColor.darkwhite,
        foregroundColor: Colors.black,
        child: Column(
          children: [
            Image.asset(
              "assets/images/Category.png",
              width: width * 0.08,
              height: height * 0.05,
            ),
            Text(
              "Menu",
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
