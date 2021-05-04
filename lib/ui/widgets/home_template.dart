import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haber/core/models/news_model.dart';
import 'package:haber/ui/widgets/news_template.dart';
import "package:haber/core/service/get_news.dart";

class HomePage extends StatefulWidget {
  final String title, api;

  const HomePage({Key key, this.title, this.api}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ScrollController _scrollController = new ScrollController();
  final news = NewsApi();
  static List<NewsModel> newsliste = [];
  bool isloading = true;
  bool hasmore = false;
  int pagenumber = 1;
  bool nointernet = false;
  @override
  void initState() {
    super.initState();
    getNews();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getNews();
      }
    });
  }

  Future<void> onrefresh() async {
    pagenumber = 0;
    newsliste = [];
    getNews();
  }

  void getNews() async {
    try {
      pagenumber++;
      setState(() {
        hasmore = true;
      });
      await news.getNews("as", pagenumber).then((List<NewsModel> data) {
        if (data.isEmpty) {
          setState(() {
            hasmore = false;
          });
        } else {
          setState(() {
            newsliste.addAll(data);
            hasmore = false;
          });
        }
      });
    } on SocketException {
      setState(() {
        nointernet = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (newsliste.isNotEmpty) {
      isloading = false;
    }
    return isloading == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : nointernet == true
            ? Container()
            : RefreshIndicator(
                onRefresh: onrefresh,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: false,
                        floating: true,
                        snap: true,
                        centerTitle: true,
                        title: Text(widget.title),
                      ),
                      isloading == true
                          ? _circular()
                          : SliverPadding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                              sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                if (index >= newsliste.length) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }

                                return NewsWidget(
                                  imgUrl: newsliste[index].imgUrl,
                                  title: newsliste[index].title,
                                  newsUrl: newsliste[index].newsUrl,
                                  source: newsliste[index].source,
                                  pubdate: newsliste[index].pubdate,
                                );
                              },
                                      childCount: hasmore == true
                                          ? newsliste.length + 1
                                          : newsliste.length)),
                            ),
                    ],
                  ),
                ),
              );
  }

  Widget _circular() {
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

// return Container(
//                       child: Column(
//                         children: [
//                           Container(
//                             child: ListView.builder(
//                               physics: BouncingScrollPhysics(),
//                               shrinkWrap: true,
//                               scrollDirection: Axis.vertical,
//                               itemCount:snapshot.data.length + 1 ,
//                               itemBuilder: (BuildContext context, index) {
//                                 if(snapshot.data.length>index){
//                                   return NewsWidget(
//                                   title: snapshot.data[index].title,
//                                   imgUrl: snapshot.data[index].imgUrl,
//                                   source: snapshot.data[index].source,
//                                   newsUrl: snapshot.data[index].newsUrl,
//                                 );
//                                 }
//                                 if (news.hasmore) {
//                                   return Center(
//                                     child: CircularProgressIndicator(),
//                                   );
//                                 }
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                     );
