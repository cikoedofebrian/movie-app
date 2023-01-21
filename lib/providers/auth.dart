import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
        throw (Exception(response['error']['message'].toString()));
      }
      _token = response['idToken'];
      _userId = response['localId'];

      Future<SharedPreferences> prefs = SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
        },
      );
      prefs.then((value) {
        value.setString('userData', userData);
      });
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> autoLogin() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((prefs) {
      if (!prefs.containsKey('userData')) {
        return false;
      }
      final extractedUserData =
          json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
      _token = extractedUserData['token'] as String;
      _userId = extractedUserData['userId'] as String;
      notifyListeners();
    });
    return true;
  }

  void logOut() {
    _userId = null;
    _token = null;
    notifyListeners();
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      value.clear();
    });
  }
}
