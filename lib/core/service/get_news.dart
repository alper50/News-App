import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsApi {
  Future<List<NewsModel>> getNews(apii, currentpage) async {
    String api =
        "https://37a5f25d32b0.ngrok.io/haber-api/api/haber/read_single.php?page=$currentpage&rowperpage=10";

    final response = await http.get(api);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        List<dynamic> newslistee = jsonDecode(response.body);
        List<NewsModel> haberler =
            newslistee.map((dynamic item) => NewsModel.fromJson(item)).toList();
        return haberler;
      }
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
