class NewsModel {
  String imgUrl;
  String title;
  String newsUrl;

  NewsModel({this.imgUrl,this.title,this.newsUrl});

  factory NewsModel.fromJson(Map<String , dynamic> json){
    return NewsModel(
      title: json["title"],
      newsUrl: json["link"],
      imgUrl: json["imgurl"],
      
    );
  }
}
