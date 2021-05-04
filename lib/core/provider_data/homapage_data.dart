import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haber/core/models/news_model.dart';
import 'package:haber/core/service/get_news.dart';

class HomePageData extends ChangeNotifier {
  static List<NewsModel> newsliste = [];
  final news = NewsApi();
  bool isloading = true;
  bool hasmore = false;
  int pagenumber = 1;
  bool nointernet = false;

  Future<void> onrefresh() async {
    pagenumber = 0;
    newsliste = [];
    getNews();
    notifyListeners();
  }

  void getNews() async {
    try {
      pagenumber++;

      hasmore = true;

      await news.getNews("as", pagenumber).then((List<NewsModel> data) {
        if (data.isEmpty) {
          hasmore = false;
        } else {
          newsliste.addAll(data);
          hasmore = false;
        }
      });
    } on SocketException {
      nointernet = true;
    }
    notifyListeners();
  }
}
