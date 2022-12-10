import 'package:flutter/material.dart';
import '../models/orders_line_model.dart';
import '../screens/Receive/receive_orders_line.dart';
import '../screens/Receive/received_order_line2.dart';

class OrderListFunction {
  // OrderListFunction(barcodeId);

  Future<OrderLine?> orderLineData(
      {required BuildContext context, required String barcodeId}) async {
    OrderLine? datass;

    var globalorderLine;
    for (var i = 0; i < globalorderLine.length; i++) {
      print("thired Print ${globalorderLine[i].userid}");
      if (globalorderLine[i].skuId == barcodeId) {
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

  Future<String?> appBarData(
      {required BuildContext context, required String barcodeId}) async {
    String newData;

    for (var i = 0; i < globalorderLine.length; i++) {
      if (globalorderLine[i].pickingId == barcodeId) {
        globallineDateTwo = globalorderLine[i];
        Text(
            '${globalorderLine[i].quantityDone.toString()}/${globalorderLine[i].productOnQty.toString()}');
      }
    }
  }
}
