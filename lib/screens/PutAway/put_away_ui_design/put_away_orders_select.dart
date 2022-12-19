import 'package:flutter/material.dart';
import 'package:wearhouse/screens/PutAway/put_away_ui_design/put_away_orders_line.dart';
import 'package:wearhouse/screens/PutAway/put_away_widget/put_away_filter_widget.dart';
import 'package:wearhouse/screens/PutAway/put_away_widget/put_away_order_prod_widget.dart';

import '../../../const/color.dart';
import '../../Receive/received_page_container.dart';

class PutAwayOrdersSelect extends StatefulWidget {
  static const routeName = 'put_away_order_select';
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
          preferredSize: _visible ? Size(0, height * 0.5) : const Size(0, 0),
          child: Container(
              height: _visible ? height * 0.5 : height * 0,
              decoration: const BoxDecoration(
                  color: Color(0xFF706E6E),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: const PutAwayFilterWidget()),
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
        child: SingleChildScrollView(
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
      ),
    );
  }
}
