import 'dart:convert';

import 'package:haber/core/models/sourcemodel.dart';
import 'package:http/http.dart' as http;

class Source {
  Future<List<SourceModel>> getSource() async {
    String api =
        "https://37a5f25d32b0.ngrok.io/haber-api/api/source/getsource.php";

    var response = await http.get(api);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        List<dynamic> newslistee = jsonDecode(response.body);
        List<SourceModel> haberler = newslistee
            .map((dynamic item) => SourceModel.fromJson(item))
            .toList();
        return haberler;
      }
    } else {
      throw "haber bulunamadı";
    }
  }
}
