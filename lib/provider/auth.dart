import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:groccery_stores/Models/http_exception.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token!;
    }
    return null;
  }

  Future<void> authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyCuFUjV8lReEV9XIRmaPyZ3bBTUJ7muBLw';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
        seconds: int.parse(responseData['expiresIn']),
      ));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return authenticate(email, password, 'signupNewUser');
  }

  Future<void> signin(String email, String password) async {
    return authenticate(email, password, 'verifyPassword');
  }

  void logOut() {
    _token = null;
    _expiryDate = null;
    _userId = null;
    notifyListeners();
  }
}
