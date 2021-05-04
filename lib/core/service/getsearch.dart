import 'dart:convert';

import 'package:haber/core/models/search_model.dart';
import 'package:http/http.dart' as http;

class Searcheddata {
  
  static Future<List<SearchModel>> getSearch(String searchkey) async {
    String api =
        "https://8a0eb4db81e7.ngrok.io/HABER-API/api/haber/search.php?search=$searchkey";

    var response = await http.get(api);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        List<dynamic> searcheddata = jsonDecode(response.body);
         List<SearchModel> searchs = searcheddata
            .map((dynamic item) => SearchModel.fromJson(item))
            .toList();
        return searchs;
      }
    } else {
      throw "Arama bulunamadı";
    }
    
  }
}
