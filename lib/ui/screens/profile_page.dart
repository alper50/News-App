import 'package:flutter/material.dart';
import 'package:haber/core/provider_data/theme_data.dart';
import 'package:haber/ui/widgets/profile_tab1.dart';
import 'package:haber/ui/widgets/profile_tab2.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Provider.of<MyThemeData>(
                      context,
                      listen: false,
                    ).updateTheme();
                  },
                  icon: Provider.of<MyThemeData>(context).isdarkmodeon == false
                      ? Icon(Icons.wb_sunny_rounded)
                      : Icon(Icons.nights_stay_rounded),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "tosettings");
                  },
                  icon: Icon(Icons.settings),
                ),
              ],
              toolbarHeight: 50,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 20),
                    child: Text(
                      "PROFİLE",
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TabBar(
                    isScrollable: true,
                    indicatorWeight: 3.0,
                    indicatorColor: Colors.grey,
                    tabs: [
                      Tab(text: "Bildirimler"),
                      Tab(text: "Kaydedilenler"),
                      Tab(text: "Dergilerim"),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ProfileTabbir(),
            ProfileTabiki(),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Text("Yapım Aşamasında"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
