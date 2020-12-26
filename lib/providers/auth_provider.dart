import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const prefsAuthKey = "auth-data";

class Auth with ChangeNotifier {
  String _accessToken;
  String _refreshToken;

  bool get isAuth {
    print("Here: " + (_accessToken != null).toString());
    return _accessToken != null;
  }

  void authenticate(String token, String refreshToken) async {
    _accessToken = token;
    _refreshToken = refreshToken;

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final authData = json
        .encode({'accessToken': _accessToken, 'refreshToken': _refreshToken});

    prefs.setString(prefsAuthKey, authData);
  }

  Future<bool> tryToLoginBack() async {
    print("called tryToLoginBack");
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(prefsAuthKey)) {
      return false;
    }

    final authData =
        json.decode(prefs.getString(prefsAuthKey)) as Map<String, Object>;

    if (authData == null) {
      return false;
    }

    _accessToken = authData['accessToken'];
    _refreshToken = authData['refreshToken'];

    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _accessToken = null;
    _refreshToken = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
