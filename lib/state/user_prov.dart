import 'package:flutter/material.dart';

class UserProv extends ChangeNotifier{
  String? _token;
  String? get token => _token;
  set token(String? token){
    _token = token;
    notifyListeners();
  }
  UserProv({String? token}):_token = token;
}