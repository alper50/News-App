class NewsModel {
  String title;
  String newsUrl;
  String imgUrl;
  String source;
  String pubdate;

  NewsModel({this.title, this.newsUrl, this.imgUrl, this.source, this.pubdate});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      newsUrl: json['link'],
      imgUrl: json['imgurl'],
      source: json['source'],
      pubdate: json['pubdate'],
    );
  }
}
