import 'package:animations/animations.dart';
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
import 'package:haber/ui/widgets/home_template.dart';
import 'package:haber/ui/widgets/themedata.dart';
import 'package:provider/provider.dart';
import 'core/provider_data/bottom_nav_bar_data.dart';
import 'core/provider_data/state_data.dart';
import 'ui/screens/notification_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyThemeData().createShared();
  runApp(
    ChangeNotifierProvider<MyThemeData>(
      create: (context) => MyThemeData(),
      child: MaterialHome(),
    ),
  );
}

class MaterialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MyThemeData>(context, listen: false).loadFromShared();
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
       initialRoute: Provider.of<MyThemeData>(context).isfirstopen == true ?
            "/"
           : "tohome",
      routes: {
        "/": (context) => ChangeNotifierProvider<StateData>(
              create: (_) => StateData(),
              child: IntroPage(),
            ),
        "tohome": (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider<BottomNavBarData>(
                  create: (BuildContext context) {
                    return BottomNavBarData();
                  },
                  // burası bottomnavbar ın oldugu uygulamanın çatısı
                ),
              ],
              child: MainHome(),
            ),
        "toweb": (context) => NewsWebView(),
        "tosettings": (context) => SettingsPage(),
        "tosettingsnotify": (context) => NotifySetting(),
        "tonews": (context) =>
            HomePageBase(), //home pagebase her kategorinin ortak sayfası
      },
    );
  }
}

class MainHome extends StatelessWidget {
  final List<Widget> _children = [
    HomePage(
      api: "https://e767411df0b1.ngrok.io/haber-api/api/haber/read_single.php?",
      title: "SANA ÖZEL",
    ),
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
        body: PageTransitionSwitcher(
          transitionBuilder: (
            child,
            animation,
            secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: IndexedStack(
            index: bottomnavbarindex,
            children: List.from(_children),
          ),
        ),
        bottomNavigationBar: FlashyTabBar(
          showElevation: true,
          iconSize: 23.0,
          selectedIndex: bottomnavbarindex,
          onItemSelected: (index) {
            bottomnavbarfunc(index);
          },
          items: [
            FlashyTabBarItem(
              activeColor: Colors.red[400],
              inactiveColor: Colors.red[700],
              icon: Icon(Icons.home_rounded,size: 27,),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red[400],
              inactiveColor: Colors.red[700],
              icon: Icon(Icons.explore_rounded,size: 26,),
              title: Text('Keşfet'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red[400],
              inactiveColor: Colors.red[700],
              icon: Icon(Icons.search_rounded,size: 27,),
              title: Text('Arama'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.red[400],
              inactiveColor: Colors.red[700],
              icon: Icon(Icons.person,size: 27,),
              title: Text('Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
