import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/listTile_widget.dart';
import 'package:haber/ui/widgets/search_widget.dart';

class SearchPage extends StatelessWidget {
  final tech = <String>[
    "Webrazzi",
    "Webtekno",
    "Shiftdelete.net",
    "Donanım Haber"
  ];
  final business = <String>[
    "Ekonomist",
    "Big Para",
    "UzmanPara",
    "Cnn Ekonomi"
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          elevation: 0,
          pinned: false,
          floating: true,
          snap: true,
          toolbarHeight: 65.0,
          automaticallyImplyLeading: false,
          title: Center(
            child: SearchButton(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "TEKNOLOJİ",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: "roboto"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Icon(Icons.arrow_right_alt,color: Colors.red,size: 30.0,),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 80,
          delegate: SliverChildBuilderDelegate(
            (context, index) => MyListTile(
              istrailing: 1,
              title: tech[index],
            ),
            childCount: tech.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "İŞ & FİNANS",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: "roboto"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Icon(Icons.arrow_right_alt,color: Colors.red,size: 30.0,),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 80,
          delegate: SliverChildBuilderDelegate(
            (context, index) => MyListTile(
              istrailing: 1,
              title: business[index],
            ),
            childCount: business.length,
          ),
        ),
      ],
    );
  }
}

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).secondaryHeaderColor,
      onTap: () {
        showSearch(
          context: context,
          delegate: SearchWidget(),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 2.0,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ignore: missing_required_param
            IconButton(
              icon: Icon(Icons.search_rounded),
            ),
            Text(
              "Haberlerde ara",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
