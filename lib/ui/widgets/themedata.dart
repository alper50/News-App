import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightheme = ThemeData(
    fontFamily: "Play",
    brightness: Brightness.light,
    cardTheme: CardTheme(
      color: Colors.grey[50],
      elevation: 6.0,
      shadowColor: Colors.grey[50],
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 25.0,
    ),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.white,
      textTheme: TextTheme(
        // ignore: deprecated_member_use
        title: TextStyle(
          color: Colors.black,
          fontSize: 21.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.only(
        right: 5.0,
        left: 10.0,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey.shade50,
      splashColor: Colors.grey[300],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
    ),
  );

  static final ThemeData darktheme = ThemeData(
    fontFamily: "Play",
    brightness: Brightness.dark,
    cardTheme: CardTheme(
      color: Colors.grey[900],
      elevation: 6.0,
      shadowColor: Colors.grey[900],
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 25.0,
    ),
    primaryColor: Colors.grey,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.black,
      textTheme: TextTheme(
        // ignore: deprecated_member_use
        title: TextStyle(
          color: Colors.white,
          fontSize: 21.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.only(
        right: 5.0,
        left: 10.0,
      ),
      unselectedLabelColor: Colors.white60,
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey.shade50,
      splashColor: Colors.grey[300],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      backgroundColor: Colors.grey[800],
    ),
  );
}
