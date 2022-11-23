import 'package:flutter/material.dart';
import '../models/orders_line_model.dart';
import '../screens/receive_orders_line.dart';
import '../screens/received_order_line2.dart';

class OrderListFunction {
  Future<OrderLine?> orderLineData(
      {required BuildContext context, required String barcodeId}) async {
    OrderLine? datass;

    for (var i = 0; i < globalorderLine.length; i++) {
      print("thired Print ${globalorderLine[i].id}");
      if (globalorderLine[i].pickingId == barcodeId) {
        datass = globalorderLine[i];
        globallineDateTwo = globalorderLine[i];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrederLinePage2(
                      barcode: barcodeId,
                      value: globalorderLine[i],
                    )));
      }
    }
    return datass;
  }
}
