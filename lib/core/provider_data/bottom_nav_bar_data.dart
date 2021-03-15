import 'package:flutter/material.dart';

class BottomNavBarData extends ChangeNotifier{
  int bottomNavBar = 0;

  void bottomNavBarfunc(index){
    bottomNavBar = index;
    notifyListeners();
  }
}