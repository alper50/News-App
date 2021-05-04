import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyThemeData extends ChangeNotifier{
  bool isdarkmodeon = false;
  bool isfirstopen = true;
  static SharedPreferences _sharedPref;
  void updateTheme(){
    isdarkmodeon ==false ? isdarkmodeon = true: isdarkmodeon = false;
    saveToShared(isdarkmodeon,"themedata");
    notifyListeners();
  }
  void updateFirstOpen(){
    isfirstopen =false;
    saveToShared(isfirstopen,"isfirstopen");
    notifyListeners();
  }

  Future<void> createShared()async{
    _sharedPref = await SharedPreferences.getInstance();
   }

   void saveToShared(bool value,String saveas){
     _sharedPref.setBool("$saveas", value);
   }

   void loadFromShared()async{
     
       isdarkmodeon=_sharedPref.getBool("themedata") ?? false;
       isfirstopen=_sharedPref.getBool("isfirstopen") ?? true;
  }
}