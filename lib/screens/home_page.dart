import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wearhouse/const/color.dart';
import 'package:wearhouse/provider/login_details.provider.dart';
import 'package:wearhouse/screens/receive_page.dart';
import 'package:wearhouse/services/api/recive_api.dart';

import '../provider/recive_orders_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static const routename = "home_page";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime timePressedBack = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final diffrence = DateTime.now().difference(timePressedBack);
        final warning = diffrence >= const Duration(seconds: 2);

        timePressedBack = DateTime.now();
        if (warning) {
          const message = 'press Back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 18);

          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.appbarColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: Image.asset(
                "assets/images/Category.png",
              ),
              onPressed: () {},
            ),
          ),
          title: const Text(
            "Mobile WMS",
            style: TextStyle(
                fontSize: 18,
                color: CustomColor.homepageBgColor,
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                "assets/images/Notification.png",
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 3),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Profileimage.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mobina Sadat",
                        style: TextStyle(
                            fontSize: 20,
                            color: CustomColor.homepageBgColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Mobina@Sima",
                        style: TextStyle(
                            fontSize: 15,
                            color: CustomColor.homepageBgColor,
                            fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Container(
                            height: height * 0.050,
                            width: width * 0.050,
                            child: Image.asset(
                              'assets/images/Location.png',
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "In Dubai Office",
                            style: TextStyle(
                                fontSize: 15,
                                color: CustomColor.homepageBgColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    onTap: () {
                      RecieveAPI().recievedoders(context: context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReceiveOrders()));
                      ChangeNotifier();
                    },
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Receive",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.customgray),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset("assets/images/Receive.png")),
                            Image.asset(
                              "assets/images/receivebox.png",
                              height: height / 10,
                              width: width / 8,
                            )
                          ]),
                      height: height * 0.2,
                      width: height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColor.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Put Away",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.customgray),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset("assets/images/putaway.png")),
                          Image.asset(
                            "assets/images/receivebox.png",
                            height: height / 10,
                            width: width / 8,
                          )
                        ]),
                    height: height * 0.2,
                    width: height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColor.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Recent Activities",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.16,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColor.yellow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.2,
                            height: height * 0.2,
                            decoration: const BoxDecoration(
                              color: CustomColor.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(26),
                              child: Image.asset(
                                'assets/images/checking.png',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                "You have checked",
                                style: const TextStyle(
                                    color: CustomColor.homepageBgColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Text(
                                "12 Packages",
                                style: TextStyle(
                                    color: CustomColor.homepageBgColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/images/leftarrow.png",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
