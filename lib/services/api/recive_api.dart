import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as https;
import 'package:wearhouse/const/config.dart';
import 'package:wearhouse/models/orders_line_model.dart';
import 'package:wearhouse/models/quality_check_questions.dart';
import 'package:wearhouse/models/quality_value.dart';
import 'package:wearhouse/provider/login_details.provider.dart';

import 'package:wearhouse/services/alert_box.dart';
import 'package:wearhouse/services/snackbar.dart';

import '../../models/recived_details_model.dart';
import '../../models/reciveorders_model.dart';

//This is the Recive orders page API derived page
//Dio was used for get api details.
class RecieveAPI with ChangeNotifier {
  GlobalSnackbar globalSnackBar = GlobalSnackbar();
  GlobalAlertBox globalAlertBox = GlobalAlertBox();

  List<String> _updateProd = [];

  List<String> get updateProd {
    return _updateProd;
  }

  bool _isLoading = false;
  bool get isLoading {
    if (_isLoading == "") {
      _isLoading = "Not yet updated" as bool;
      return _isLoading;
    } else {
      return _isLoading;
    }
  }

  String _domain = "";

  String get domain {
    if (_domain == "") {
      _domain = "Not yet updated";
      return _domain;
    } else {
      return _domain;
    }
  }

  List<RecivedOrdersModel> _rec = [];
  RecievedDetails? _par;
  List<QualityQuestions> _ques = [];
  List<QualityQuestionsValue> _quesValue = [];
  List<OrderLine> _ord = [];

  List<RecivedOrdersModel> get rec {
    // ignore: unrelated_type_equality_checks
    return _rec;
    // if (_rec == "") {
    //   _rec = "Not yet updated" as List<RecivedOrdersModel>;

    // } else {
    //   return _rec;
    // }
  }

  RecievedDetails? get par {
    // ignore: unrelated_type_equality_checks
    if (_par == "") {
      _par = "Not yet updated" as RecievedDetails;
      return _par;
    } else {
      return _par;
    }
  }

  List<QualityQuestions> get ques {
    if (_ques == "") {
      _ques = "Not yet updated" as List<QualityQuestions>;
      return _ques;
    } else {
      return _ques;
    }
  }

  List<QualityQuestionsValue> get quesValue {
    if (_quesValue == "") {
      _quesValue = "Not yet updated" as List<QualityQuestionsValue>;
      return _quesValue;
    } else {
      return _quesValue;
    }
  }

  List<OrderLine> get ord {
    return _ord;
    // if (_ord == "") {
    //   _ord = "Not yet updated" as List<OrderLine>;
    //   return _ord;
    // } else {
    //   return _ord;
    // }
  }

  Future<List<RecivedOrdersModel>> recievedoders(
      {required BuildContext context}) async {
    _isLoading = true;

    final user = Provider.of<UserDetails>(context, listen: false);

    await user.getAllDetails();
    List<RecivedOrdersModel> getOrders = [];

    var headers = {
      'Cookie':
          'session_id=ad9b3d63d0f6e25ada8e6568cf58fa1a599002b9; session_id=830516724d3bb81b684f4a9457d7f11cb28ba537'
    };

    String clinedId = user.clientID;

    var url =
        "http://eiuat.seedors.com:8290/seedor-api/warehouse/received-orders?fields={'id','scheduled_date','origin','display_name','date','partner_id','create_date','barcode'}&clientid=$clinedId";
    print(
        "first http-->http://eiuat.seedors.com:8290/seedor-api/warehouse/received-orders?fields={'id','scheduled_date','origin','display_name','date','partner_id','create_date','barcode'}&clientid=$clinedId");
    try {
      https.Response response =
          await https.get(Uri.parse(url), headers: headers);
      print("respnsee-->$response");
      var jsonData = json.decode(response.body);
      print("json-->$jsonData");
      print(response.body);
      if (response.statusCode == 200) {
        for (var i = 0; i < jsonData.length; i++) {
          getOrders.add(RecivedOrdersModel(
            barcode: jsonData[i]["barcode"].toString(),
            createDate: jsonData[i]["create_date"].toString(),
            date: jsonData[i]["date"].toString(),
            displayName: jsonData[i]["display_name"].toString(),
            id: jsonData[i]["id"].toString(),
            origin: jsonData[i]["origin"].toString(),
            partnerId: jsonData[i]["partner_id"][0].toString(),
            companyName: jsonData[i]["partner_id"][1].toString(),
            scheduledDate: jsonData[i]["scheduled_date"].toString(),
            transportDate: jsonData[i]["transport_date"].toString(),
            skuId: jsonData[0]['x_sku_id'].toString(),
          ));
          print('partner--> ${getOrders[i].partnerId.toString()}');
        }

        _rec = getOrders;
        print(rec.length.toString() + "---> fav data length");
        _isLoading = false;
        print('NNNNNN' + getOrders.toString());
        // notifyListeners();
      } else {
        _isLoading = false;
        // notifyListeners();

        print(response.reasonPhrase! + 'last response');
      }
    } on HttpException catch (e) {
      print(e);
    }
    return getOrders;
  }

  Future<RecievedDetails?> particularOrders(
      {required BuildContext context, required String domain}) async {
    _isLoading = true;

    final user = Provider.of<UserDetails>(context, listen: false);

    await user.getAllDetails();

    RecievedDetails getDetails;

    var header = {
      'Cookie':
          'session_id=ad9b3d63d0f6e25ada8e6568cf58fa1a599002b9; session_id=11f5121f566165d27cf73b9a28432ad6d0b3597b'
    };
    String clinedId = user.clientID;

    var url =
        "http://eiuat.seedors.com:8290/seedor-api/warehouse/received-orders?fields={'id','scheduled_date','origin','transport_date','display_name','date','partner_id','create_date','barcode',}&clientid=$clinedId&domain=[('id','=',$domain)]";
    print(
        "First domain-->http://eiuat.seedors.com:8290/seedor-api/warehouse/received-orders?fields={'id','scheduled_date','origin','transport_date','display_name','date','partner_id','create_date','barcode'}&clientid=$clinedId&domain=[('id','=',$domain)]");
    try {
      https.Response response =
          await https.get(Uri.parse(url), headers: header);
      print("Barcode value --> ${response.body}");
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        getDetails = (RecievedDetails(
          // isVisible: false,
          barcode: jsonData[0]["barcode"].toString(),
          createDate: jsonData[0]["create_date"].toString(),
          date: jsonData[0]["date"].toString(),
          displayName: jsonData[0]["display_name"].toString(),
          id: jsonData[0]["id"].toString(),
          origin: jsonData[0]["origin"].toString(),
          partnerId: jsonData[0]["partner_id"][0].toString(),
          companyName: jsonData[0]["partner_id"][1].toString(),
          scheduledDate: jsonData[0]["scheduled_date"].toString(),
          skuId: jsonData[0]['x_sku_id'].toString(),
          transportDate: jsonData[0]["transport_date"].toString(),
          isVisible: true,
        ));

        // print(getDetails.id);
        print("particularorder value --> ${response.body}");
        _par = getDetails;
        // notifyListeners();
        print(par);

        print(rec.length.toString() + "---> fav data length");
        // _isLoading = false;
        print('SSSSSS' + getDetails.toString());
      } else {
        _isLoading = false;
        // notifyListeners();

        print(response.reasonPhrase);
      }
    } on HttpException catch (e) {
      print(e);
    }
    return _par;
  }

  Future<List<OrderLine>> orderLine(
      {required BuildContext context,
      required String domain,
      required String pickingId}) async {
    _isLoading = true;

    var user = Provider.of<UserDetails>(context, listen: false);

    List<OrderLine> getDetails = [];

    await user.getAllDetails();

    var headers = {
      'Cookie':
          'session_id=ad9b3d63d0f6e25ada8e6568cf58fa1a599002b9; session_id=11f5121f566165d27cf73b9a28432ad6d0b3597b'
    };

    String clainedId = user.clientID;

    var url =
        "http://eiuat.seedors.com:8290/seedor-api/warehouse/received-order-line?fields={'product_id','product_uom_qty','quantity_done','picking_partner_id','display_name','picking_id','barcode','x_sku_id','x_length','x_breadth','x_height','x_dimension','x_weight'}&clientid=$clainedId&domain=[('picking_id','=',$pickingId)]";

    print(
        "order line -->http://eiuat.seedors.com:8290/seedor-api/warehouse/received-order-line?fields={'product_id','product_uom_qty','quantity_done','picking_partner_id','display_name'}&clientid=$clainedId&domain=[('picking_id','=',$pickingId)]");

    try {
      https.Response response =
          await https.get(Uri.parse(url), headers: headers);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        for (var i = 0; i < jsonData.length; i++) {
          getDetails.add(OrderLine(
            pickingId: jsonData[i]['picking_id'][0].toString(),
            pickingName: jsonData[i]['picking_id'][1].toString(),
            displayName: jsonData[i]['display_name'].toString(),
            userid: jsonData[i]['id'].toString(),
            pickingPartnerId: jsonData[i]['picking_partner_id'][0].toString(),
            pickingPartnerName: jsonData[i]['picking_partner_id'][1].toString(),
            productId: jsonData[i]['product_id'][0].toString(),
            productName: jsonData[i]['product_id'][1].toString(),
            productOnQty:
                double.parse(jsonData[i]['product_uom_qty'].toString())
                    .floor()
                    .toString(),
            skuId: jsonData[i]['x_sku_id'].toString(),
            quantityDone: double.parse(jsonData[i]['quantity_done'].toString())
                .floor()
                .toString(),
            breadth: jsonData[i]['x_breadth'].toString(),
            height: jsonData[i]['x_height'].toString(),
            length: jsonData[i]['x_length'].toString(),
            weight: jsonData[i]['x_weight'].toString(),
          ));
        }
        print("Barcode2 value --> ${response.body}");
        _ord = getDetails;
        // notifyListeners();
        print(ord);

        print(_ord.length.toString() + "---> fav orderline length");

        print('OOOOOOO' + getDetails.toString());
        // notifyListeners();

        print("${response.reasonPhrase} + order line response");
      } else {
        _isLoading = false;
      }
    } on HttpException catch (e) {
      print(e);
    }
    return _ord;
  }

  Future<void> orderLineQuantity(
      {required String quantity,
      required String length,
      required String height,
      required String breadth,
      required String weight,
      required String skuId,
      required String productId,
      required BuildContext context,
      required String domain}) async {
    _isLoading = true;

    var user = Provider.of<UserDetails>(context, listen: false);

    await user.getAllDetails();

    String verifiedId = user.id;

    var header = {
      'Cookie':
          'session_id=8a47612539d2b93909330392d4b6369f5d83dfa9; session_id=b161ecd263cad0ef56bd6055aaaf7a6e0d8b59cd; session_id=f95ae8522f72d7ff05f1a72c60a9ead326f691ca'
    };

    String clainedId = user.clientID;
    print("original id -->$skuId");
    var url =
        'http://eiuat.seedors.com:8290/seedor-api/warehouse/update-recived/$productId?clientid=$clainedId&quantity=$quantity&length=$length&breadth=$breadth&height=$height&weight=$weight&verified_by=$verifiedId';

    print(
        'url order line quantity -->http://eiuat.seedors.com:8290/seedor-api/warehouse/update-recived/$productId?clientid=$clainedId&quantity=$quantity&length=$length&breadth=$breadth&height=$height&weight=$weight&verified_by=$verifiedId');

    try {
      https.Response response =
          await https.put(Uri.parse(url), headers: header);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        _updateProd.add(productId);

        print(_updateProd.length.toString() + "updateProd");

        print(response.body);

        _isLoading = false;

        globalSnackBar.successsnackbar(context: context, text: "Updated");

        // await RecieveAPI().orderLine(
        //     context: context, domain: domain, pickingId: _par!.id.toString());

        // Navigator.pop(context);
        // print("2nd Api --> ${RecieveAPI().orderLine(
        //   context: context,
        //   domain: domain,
        //   pickingId: _par!.id.toString(),
        // )}");
      } else {
        await globalSnackBar.successsnackbar(context: context, text: "failed");
      }
    } on HttpException catch (e) {
      print(e);
    }
  }

  Future<List<QualityQuestions?>> qualityCheck(
      {required BuildContext context, required String userId}) async {
    _isLoading = true;

    final user = Provider.of<UserDetails>(context, listen: false);

    await user.getAllDetails();

    List<QualityQuestions> getDetails = [];

    var header = {
      'Cookie':
          'session_id=8a47612539d2b93909330392d4b6369f5d83dfa9; session_id=b161ecd263cad0ef56bd6055aaaf7a6e0d8b59cd; session_id=f95ae8522f72d7ff05f1a72c60a9ead326f691ca'
    };
    String clinedId = user.clientID;

    var url =
        "http://eiuat.seedors.com:8290/seedor-api/warehouse/quality-check/scenario?clientid=$clinedId&id=$userId&fields={'id','name'}";
    print(
        "qustion Api --->http://eiuat.seedors.com:8290/seedor-api/warehouse/quality-check/scenario?clientid=$clinedId&id=$userId&fields={'id','name'} ");
    try {
      https.Response response =
          await https.get(Uri.parse(url), headers: header);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var i = 0; i < jsonData.length; i++) {
          getDetails.add(QualityQuestions(
              id: jsonData[i]['id'].toString(),
              questions: jsonData[i]['name'].toString()));
        }

        print("questions--> ${response.body}");

        _ques = getDetails;
        // notifyListeners();
        print(ques);

        print(ques.toString() + "---> fav data length");
        // _isLoading = false;
        print('quququququ' + getDetails.toString());
      } else {
        isLoading == false;
      }
    } on HttpException catch (e) {
      print(e);
    }
    return _ques;
  }

  Future<List<QualityQuestionsValue?>> qualityCheckValue(
      {required BuildContext context, required String userId}) async {
    _isLoading = true;

    final user = Provider.of<UserDetails>(context, listen: false);

    await user.getAllDetails();

    List<QualityQuestionsValue> getDetails = [];

    var header = {
      'Cookie':
          'session_id=8a47612539d2b93909330392d4b6369f5d83dfa9; session_id=b161ecd263cad0ef56bd6055aaaf7a6e0d8b59cd; session_id=f95ae8522f72d7ff05f1a72c60a9ead326f691ca'
    };
    String clinedId = user.clientID;

    var url =
        "http://eiuat.seedors.com:8290/seedor-api/warehouse/quatity-check/dropdown?clientid=$clinedId&id=$userId&fields={'id','name'}&type=quality-test-value";
    print(
        "qustionValue Api --->http://eiuat.seedors.com:8290/seedor-api/warehouse/quality-check/scenario?clientid=$clinedId&id=$userId&fields={'id','name'} ");
    try {
      https.Response response =
          await https.get(Uri.parse(url), headers: header);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var i = 0; i < jsonData.length; i++) {
          getDetails.add(QualityQuestionsValue(
              id: jsonData[i]['id'].toString(),
              questions: jsonData[i]['name'].toString()));
        }

        print("questionsValue--> ${response.body}");

        _quesValue = getDetails;
        // notifyListeners();
        print(quesValue);

        print(quesValue.toString() + "---> fav data length");
        // _isLoading = false;
        print('qu1qu1qu1qu1qu1' + getDetails.toString());
      } else {
        isLoading == false;
      }
    } on HttpException catch (e) {
      print(e);
    }
    return _quesValue;
  }

  Future<void> qualityValueGet({
    required BuildContext context,
    required String feedBack,
    required String questionId,
    required String answerId,
  }) async {
    final user = Provider.of<UserDetails>(context, listen: false);

    await user.getAllDetails();

    var header = {
      "Cookie":
          "session_id=b161ecd263cad0ef56bd6055aaaf7a6e0d8b59cd; session_id=f95ae8522f72d7ff05f1a72c60a9ead326f691ca"
    };

    var url =
        "http://eiuat.seedors.com:8290/seedor-api/warehouse/quality-check/update?question_id=$questionId&answer_id=$answerId&note=$feedBack&verified_by=2&clientid=${user.clientID}";
    print(
        "qualityValueGet---->http://eiuat.seedors.com:8290/seedor-api/warehouse/quality-check/update?question_id=$questionId&answer_id=$answerId&note=$feedBack&verified_by=2&clientid=${user.clientID}");

    try {
      https.Response response =
          await https.put(Uri.parse(url), headers: header);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
      } else {
        globalSnackBar.genarelSnackbar(
            context: context, text: "Failed To Connect");
      }
    } on HttpException catch (e) {
      print(e);
    }
  }
}
