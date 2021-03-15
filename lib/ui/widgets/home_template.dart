import 'package:flutter/material.dart';

import 'news_template.dart';

class HomeTemp extends StatelessWidget {

  final title,itemcount,newstitle,newsimgurl,newssource,newsurl;

  const HomeTemp({Key key, this.title, this.itemcount, this.newstitle, this.newsimgurl, this.newssource, this.newsurl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: false,
          floating: true,
          centerTitle: true,
          title: Text(title),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
                child: Column(
              children: [
                Container(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: itemcount,
                      itemBuilder: (BuildContext context, index) {
                        return NewsWidget(
                          title: newstitle,
                          imgUrl: newsimgurl,
                          source: newssource,
                          newsUrl: newsurl,
                        );
                      }),
                )
              ],
            )),
          ),
        ),
      ],
    );
  }
}