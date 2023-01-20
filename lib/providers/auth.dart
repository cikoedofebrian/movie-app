import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Authentication extends ChangeNotifier {
  String? _token;
  String? _userId;

  bool get isAuth {
    return _token != null;
  }

  void changetoken() {
    _token = "ssss";
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    try {
      final url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBgrSuMITaZQ7aa-MDR2iYAP-LK5800zBk");

      final accountData = json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });
      var request = await http.post(url, body: accountData);
      var response = json.decode(request.body);
      _token = response['idToken'];
      _userId = response['localId'];
      notifyListeners();
    } catch (error) {}
  }
}
