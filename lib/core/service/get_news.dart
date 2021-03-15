import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

// List<String> imgUrls = [
//   "https://i2.cnnturk.com/i/cnnturk/75/720x490/5fef75b117aca9197c453a5e",
//   "https://i2.cnnturk.com/i/cnnturk/75/720x490/5fef6c4717aca9197c453a26",
//   "https://i2.cnnturk.com/i/cnnturk/75/720x490/5fef66ef17aca9197c453a18"
// ];
// List<String> titles = [
//   "Roma&#39;da yılbaşı kabusu! Yüzlerce kuş öldü",
//   "ABD, F-35’lerde tam kapasiteli seri üretimi askıya aldı",
//   "AB’den ayrılan İngiltere’den ‘tampon vergisi’ kararı"
// ];
// List<String> newsUrls = [
//   "https://www.cnnturk.com/dunya/romada-yilbasi-kabusu-yuzlerce-kus-oldu",
//   "https://www.cnnturk.com/dunya/son-dakika-haberi-abd-f-35lerde-tam-kapasiteli-seri-uretimi-askiya-aldi",
//   "https://www.cnnturk.com/dunya/abden-ayrilan-ingiltereden-tampon-vergisi-karari"
// ];

// List<NewsModel> getNews() {
//   List<NewsModel> newsliste = <NewsModel>[];

//   for (var i = 0; i < imgUrls.length; i++) {
//     NewsModel news = NewsModel();
//     news.imgUrl = imgUrls[i];
//     news.title = titles[i];
//     news.source = "CNN Türk";
//     news.newsUrl = newsUrls[i];
//     newsliste.add(news);
//   }
//   return newsliste;
// }
class News{
   int currentpage = 1;
    Future<List<NewsModel>> getHaber() async {
    
    String api = "https://294d91e29057.ngrok.io/haber-api/api/haber/read_single.php?page=$currentpage&rowperpage=10";

    var response = await http.get(api);
    if (response.statusCode == 200) {
      if(response.body.isNotEmpty){
      List<dynamic> newslistee = jsonDecode(response.body);
      List<NewsModel> haberler = newslistee.map((dynamic item) =>NewsModel.fromJson(item)).toList();
      print(haberler);
      currentpage++;
      return haberler;
      }
      
      
    }
    else{
      throw "haber bulunamadı";
    }
  }
   Future<void> refresh()async{
    print("çalıştı");
    return getHaber();
    
  }
}
