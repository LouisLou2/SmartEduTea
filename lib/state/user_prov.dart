import 'package:flutter/material.dart';
import 'package:smart_edu_tea/handler/auth_handler.dart';

class UserProv extends ChangeNotifier{
  late String token;

  void init(){
    // after setToken
    token = AuthHandler.getToken();
  }
}