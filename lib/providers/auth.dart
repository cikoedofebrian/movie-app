import 'package:dio/dio.dart';
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
    if (_token == null) {
      _token = "ssss";
    } else {
      _token = null;
    }

    notifyListeners();
  }

  Future<void> signUp(String email, String password, bool isLogin) async {
    Uri url;
    if (isLogin) {
      url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBgrSuMITaZQ7aa-MDR2iYAP-LK5800zBk");
    } else {
      url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBgrSuMITaZQ7aa-MDR2iYAP-LK5800zBk");
    }
    try {
      final accountData = json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });
      var request = await http.post(url, body: accountData);
      var response = json.decode(request.body);
      if (response['error'] != null) {
        throw (Exception(response['error']['message']));
      }
      _token = response['idToken'];
      _userId = response['localId'];
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  void logOut() {
    _userId = null;
    _token = null;
    notifyListeners();
  }
}
