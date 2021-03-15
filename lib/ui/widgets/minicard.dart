import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final imgUrl, title, source, newsUrl;

  const MiniCard({Key key, this.imgUrl, this.title, this.source, this.newsUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double devicewidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    return Container(
      child: Card(
        elevation: 1.5,
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
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Container(
                  width: devicewidth * 0.35,
                  height: deviceheight * 0.20,
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        width: devicewidth * 0.35,
                        height: deviceheight * 0.20,
                        child: Center(child: CircularProgressIndicator()),
                        color: Colors.red,
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
                      style: TextStyle(fontSize: 15.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.comment_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
