class SourceModel {
  String imgUrl;
  String title;

  SourceModel({this.imgUrl,this.title});

  factory SourceModel.fromJson(Map<String , dynamic> json){
    return SourceModel(
      title: json["source"],
      imgUrl: json["sourceimgurl"],
    );
  }
}
