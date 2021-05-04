import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/news_template.dart';

class ProfileTabiki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return NewsWidget(
                  title: "Kaydedilen haber",
                  source: "Kaynak",
                  newsUrl: "https:\/\/external-content.duckduckgo.com\/iu\/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Lqnt4Gll0-cyaLNuM8luZgHaEK%26pid%3DApi&f=1",
                  imgUrl: "https:\/\/external-content.duckduckgo.com\/iu\/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Lqnt4Gll0-cyaLNuM8luZgHaEK%26pid%3DApi&f=1",
                  pubdate: "1 gün önce",

                );
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.1,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 5.0,
              crossAxisCount: 1,
            ),
          ),
        ),
      ],
    );
  }
}
