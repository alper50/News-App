class SearchModel {
  String link;
  String title;

  SearchModel({this.link,this.title});

  factory SearchModel.fromJson(Map<String , dynamic> json){
    return SearchModel(
      title: json["title"],
      link: json["link"],
    );
  }
}
