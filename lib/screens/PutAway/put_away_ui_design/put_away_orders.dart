import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wearhouse/screens/PutAway/put_away_widget/bottom_widget_putaway.dart';
import 'package:wearhouse/screens/PutAway/put_away_widget/put_away_order_prod_widget.dart';
import '../../../const/color.dart';
import '../../../models/reciveorders_model.dart';
import '../put_away_widget/put_away_filter_widget.dart';

class PutAwayOrders extends StatefulWidget {
  const PutAwayOrders({super.key});
  @override
  State<PutAwayOrders> createState() => _PutAwayOrdersState();
}

bool _visible = false;

class _PutAwayOrdersState extends State<PutAwayOrders> {
  AudioPlayer audioPlayer = AudioPlayer();
  late bool hideFilder;
  late Future<List<RecivedOrdersModel>> orders;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    String? barcode;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize:
                  _visible ? Size(0, height * 0.5) : const Size(0, 0),
              child: Container(
                height: _visible ? height * 0.5 : height * 0,
                decoration: const BoxDecoration(
                    color: Color(0xFF706E6E),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: const PutAwayFilterWidget(),
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
              Row(
                children: [
                  Text(
                    "1",
                    style: const TextStyle(
                        color: CustomColor.blackcolor2,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
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
            ],
          ),
          body: ListView.separated(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(13),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CustomColor.gray200,
                      ),
                      child: const PutAwayOrderProdWidget()),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int itemCount) {
              return const Divider(
                thickness: 2,
                color: CustomColor.yellow,
              );
            },
          ),
          floatingActionButton: BottomWidget2(
            barcode: barcode,
          )),
    );
  }
}
