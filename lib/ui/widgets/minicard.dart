import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/listTile_widget.dart';

class MiniCard extends StatelessWidget {
  final imgUrl, title, api;

  const MiniCard({Key key, this.imgUrl, this.title, this.api})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "tonews",
              arguments: {
                "api":
                    "https://6b6a2b1ede7d.ngrok.io/haber-api/api/haber/read_single.php?",
                "title": title,
              },
            );
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // width:devicewidth * 0.34,
                  //  height:deviceheight *0.25,
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        // width:devicewidth * 0.35,
                        // height:deviceheight *0.35,
                        child: Center(child: CircularProgressIndicator()),
                        color: Colors.red,
                      ),
                      imageUrl: imgUrl,
                      fit: BoxFit.cover,
                      placeholderFadeInDuration: Duration(milliseconds: 500),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0,top:8),
                    child: FollowMeBtn(),
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
