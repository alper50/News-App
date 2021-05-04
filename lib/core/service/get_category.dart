import 'package:haber/core/models/category_model.dart';

List<String> categoryNames = [
  "genel",
  "ekonomi",
  "otomobil",
  "teknoloji",
  "spor",
  "kültür",
];
List<String> imgNames = [
  "https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Z2FtZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8c2NpZW5jZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHRlY2h8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHRlY2h8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
];

List<CategoryModel> getCategories() {
  List<CategoryModel> categoriliste = <CategoryModel>[];

  for (var i = 0; i < categoryNames.length; i++) {
    CategoryModel categori = new CategoryModel();
    categori.img = imgNames[i];
    categori.categoryName = categoryNames[i];

    categoriliste.add(categori);
  }
  return categoriliste;
}
