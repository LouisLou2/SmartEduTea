import 'package:flutter/material.dart';

class SidebarProv with ChangeNotifier {
  int selectedId = 0;

  void setSelectedId(int id){
    selectedId = id;
    notifyListeners();
  }

  void reset(){
    selectedId = 0;
    notifyListeners();
  }
}