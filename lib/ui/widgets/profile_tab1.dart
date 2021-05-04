import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/listTile_widget.dart';

class ProfileTabbir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFixedExtentList(
          itemExtent: 80,
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: MyListTile(istrailing: 0,title: "Bildirim: $index",),
            ),
            childCount: 15,
          ),
        ),
      ],
    );
  }
}