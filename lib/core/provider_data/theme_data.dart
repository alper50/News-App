import 'package:flutter/material.dart';

class MyThemeData extends ChangeNotifier{
  bool isdarkmodeon = false;

  void updateTheme(){
    isdarkmodeon ==false ? isdarkmodeon = true: isdarkmodeon = false;
    print("çalıştı");
    notifyListeners();
  }
}