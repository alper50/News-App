import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final imgUrl, title, source, newsUrl;

  const NewsWidget(
      {Key key,
      @required this.imgUrl,
      @required this.title,
      this.source,
      @required this.newsUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          Navigator.pushNamed(
            context,
            "toweb",
            arguments: {"newsUrl": newsUrl, "source": source},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.only(bottom: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Align(
                        child: CircularProgressIndicator(),
                        alignment: Alignment.center,
                      ),
                    ),
                    imageUrl: imgUrl,
                    placeholderFadeInDuration: Duration(milliseconds: 500),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 21.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              source,
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              " - 1 gün önce",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.comment_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
