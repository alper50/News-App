
import 'package:haber/core/models/category_model.dart';

List<String> category_names = ["Ekonomi","İş","OTOMOBİL","OYUN","BİLİM","TEKNOLOJİ","SPOR","GİRİŞİMCİLİK","KÜLTÜR","SİYASET"];
List<String> img_names = ["economy","business","car","game","science","tech","sport","startup","culture","politics"];


List<CategoryModel> getCategories(){
  List<CategoryModel> categoriliste = new List<CategoryModel>();

  for(var i=0;i<category_names.length;i++){
    CategoryModel categori = new CategoryModel();
    categori.img = img_names[i];
    categori.categoryName = category_names[i];

    categoriliste.add(categori);
  }
  return categoriliste;
}