import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final img, categoryName;

  const Category({Key key, this.img, this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "tonews",
          arguments: {
            "api":
                "https://a578e23ee7c7.ngrok.io/haber-api/api/haber/get_from_category.php?page=1&rowperpage=10&category=$categoryName",
            "title": categoryName,
          },
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: img,
            placeholder: (context, url) => Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    child: SizedBox(
                      child: CircularProgressIndicator(),
                      height: 25,
                      width: 25,
                    ),
                    alignment: Alignment.bottomRight),
              ),
              color: Colors.red,
            ),
            placeholderFadeInDuration: Duration(milliseconds: 500),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0, top: 5.0),
            child: Text(
              categoryName.toUpperCase(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
