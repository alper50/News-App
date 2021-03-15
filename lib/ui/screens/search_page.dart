import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/listTile_widget.dart';
import 'package:haber/ui/widgets/search_widget.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
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
        SliverFixedExtentList(
          itemExtent: 80,
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: MyListTile(istrailing: 1,),
            ),
            childCount: 25,
          ),
        ),

      ],
    );
  }
}

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: kElevationToShadow[5],
      ),
      child: IconButton(
        icon: Icon(Icons.search_rounded),
        onPressed: () {
          showSearch(
            context: context,
            delegate: SearchWidget(),
          );
        },
      ),
    );
  }
}
