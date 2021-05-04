import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final imgUrl, title, source, newsUrl, pubdate;

  const NewsWidget(
      {Key key,
      @required this.imgUrl,
      @required this.title,
      this.source,
      @required this.newsUrl,
      this.pubdate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double dvcwidth = MediaQuery.of(context).size.width * 0.88;
    double dvcheight = MediaQuery.of(context).size.height * 0.3;
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              Container(
                width: dvcwidth,
                height: dvcheight,
                margin: EdgeInsets.only(bottom: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: imgUrl.isNotEmpty
                      ? CachedNetworkImage(
                          placeholder: (context, url) => Container(
                            width: dvcwidth,
                            height: dvcheight,
                            child: Align(
                              child: CircularProgressIndicator(),
                              alignment: Alignment.center,
                            ),
                          ),
                          fit: BoxFit.cover,
                          imageUrl: imgUrl,
                          placeholderFadeInDuration:
                              Duration(milliseconds: 500),
                        )
                       : null,//NetworkImage(
                      //     "https://images.app.goo.gl/M3d2JxAqjj62XmMf6",
                      //   ),
                ),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 21.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 1.0),
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
                              pubdate,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ],
                        ),
                        BookMark(),
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

class BookMark extends StatefulWidget {
  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isselected == false
          ? Icons.bookmark_border_rounded
          : Icons.bookmark_rounded),
      onPressed: () {
        setState(() {
          isselected == false ? isselected = true : isselected = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: isselected == true
                ? const Text('Haber Kaydedildi')
                : const Text('Kaydedilenlerden Kaldırıldı'),
          ),
        );
      },
    );
  }
}
