import 'package:flutter/material.dart';
import 'package:haber/core/models/news_model.dart';
import 'package:haber/core/service/get_news.dart';
import 'package:haber/ui/widgets/news_template.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final News http = News();
  final news = <NewsModel>[];
  
  bool isloading = true;
  bool hasmore = true;

  @override
  void initState() {
    super.initState();
    loadMore();
  }

  void loadMore() {
    isloading = true;
    http.getHaber().then((List<NewsModel> data) {
      if (data.isEmpty) {
        setState(() {
          isloading = false;
          hasmore = false;
        });
      } else {
        setState(() {
          news.addAll(data);
          isloading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => http.refresh(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            floating: true,
            snap: true,
            centerTitle: true,
            title: Text("Sana Özel"),
          ),
          SliverToBoxAdapter(
            child: RefreshIndicator(
              onRefresh: () => isloading ? http.refresh(): null,
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
                        itemCount: hasmore ? news.length + 1 : news.length,
                        itemBuilder: (BuildContext context, index) {
                          if (index >= news.length) {
                            if (!isloading) {
                              loadMore();
                            }
                            return Container(
                              height: MediaQuery.of(context).size.height*0.65,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          return NewsWidget(
                            title: news[index].title,
                            imgUrl: news[index].imgUrl,
                            source: "CNN Türk",
                            newsUrl: news[index].newsUrl,
                          );
                        },
                      ),
                    )
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
