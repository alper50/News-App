import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import "package:flutter/material.dart";
import 'package:haber/core/provider_data/theme_data.dart';
import 'package:haber/ui/screens/explore_page.dart';
import 'package:haber/ui/screens/search_page.dart';
import 'package:haber/ui/screens/home_page.dart';
import 'package:haber/ui/screens/intro_page.dart';
import 'package:haber/ui/screens/newswebview_page.dart';
import 'package:haber/ui/screens/profile_page.dart';
import 'package:haber/ui/screens/settings_page.dart';
import 'package:haber/ui/widgets/glow_disable.dart';
import 'package:haber/ui/widgets/themedata.dart';
import 'package:provider/provider.dart';
import 'core/provider_data/bottom_nav_bar_data.dart';
import 'core/provider_data/state_data.dart';
import 'ui/screens/notification_settings.dart';

void main() {
  runApp(
    MaterialHome(),
  );
}

class MaterialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyThemeData>(
      create: (context) => MyThemeData(),
      child: Consumer<MyThemeData>(
        builder: (context, model, child) {
          return MaterialApp(
            darkTheme: AppTheme.darktheme,
            theme: AppTheme.lightheme,
            themeMode: Provider.of<MyThemeData>(context).isdarkmodeon == false
                ? ThemeMode.light
                : ThemeMode.dark,
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child,
              );
            },
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            routes: {
              "/": (context) => ChangeNotifierProvider<StateData>(
                    create: (_) => StateData(),
                    child: IntroPage(),
                  ),
              "tohome": (context) => ChangeNotifierProvider<BottomNavBarData>(
                    create: (BuildContext context) {
                      return BottomNavBarData();
                    },
                    child: MainHome(),
                  ),
              "toweb": (context) => NewsWebView(),
              "tosettings": (context) => SettingsPage(),
              "tosettingsnotify": (context) => NotifySetting(),
            },
          );
        },
      ),
    );
  }
}

class MainHome extends StatelessWidget {
  final List<Widget> _children = [
    HomePage(),
    ExplorePage(),
    SearchPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    Function bottomnavbarfunc =
        Provider.of<BottomNavBarData>(context).bottomNavBarfunc;
    int bottomnavbarindex = Provider.of<BottomNavBarData>(context).bottomNavBar;
    return SafeArea(
      child: Scaffold(
        body: _children[bottomnavbarindex],
        bottomNavigationBar: FlashyTabBar(
          showElevation: true,
          iconSize: 23.0,
          selectedIndex: bottomnavbarindex,
          onItemSelected: (index) {
            bottomnavbarfunc(index);
          },
          items: [
            FlashyTabBarItem(
              activeColor: Colors.red[700],
              inactiveColor: Colors.red[300],
              icon: Icon(Icons.home_outlined),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red[700],
              inactiveColor: Colors.red[300],
              icon: Icon(Icons.explore_outlined),
              title: Text('Keşfet'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red[700],
              inactiveColor: Colors.red[300],
              icon: Icon(Icons.search_outlined),
              title: Text('Arama'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red[700],
              inactiveColor: Colors.red[300],
              icon: Icon(Icons.supervised_user_circle_outlined),
              title: Text('Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
