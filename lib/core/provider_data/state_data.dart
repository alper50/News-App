import 'package:flutter/material.dart';

class StateData extends ChangeNotifier{
  int intropageindex = 0;

  void intropage(index){
    intropageindex = index;
    notifyListeners();
  }
}