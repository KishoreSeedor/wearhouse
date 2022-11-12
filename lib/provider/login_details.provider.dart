import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//in this page add loginpage geted details for charing other page

class UserDetails with ChangeNotifier {
  String _client_id = "";

  String get clientID {
    if (_client_id == "") {
      _client_id = "Not yet updated";
      return _client_id;
    } else {
      return _client_id;
    }
  }

  Future<void> getAllDetails() async {
    final prefs = await SharedPreferences.getInstance();
    _client_id = prefs.getString('clientid') ?? "Not yet updated";
    notifyListeners();
  }
}
