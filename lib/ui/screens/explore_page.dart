import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/explore_tab1.dart';
import 'package:haber/ui/widgets/explore_tab2.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
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
                      "KEŞFET",
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500,
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
                      Tab(text: "Kaynaklar",),
                      Tab(text: "Kategoriler"),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ExplorePageTabbir(),
            ExplorePageTabiki(),
          ],
        ),
      ),
    );
  }
}
