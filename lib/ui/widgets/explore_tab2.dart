import 'package:flutter/material.dart';
import 'package:haber/core/models/category_model.dart';
import 'package:haber/core/service/get_category.dart';
import 'package:haber/ui/widgets/category_template.dart';

class ExplorePageTabiki extends StatefulWidget {
  @override
  _ExplorePageTabikiState createState() => _ExplorePageTabikiState();
}

class _ExplorePageTabikiState extends State<ExplorePageTabiki> with AutomaticKeepAliveClientMixin{
  List<CategoryModel> categoriliste = <CategoryModel>[];

  @override
  void initState() {
    super.initState();
    categoriliste = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Category(
                  img: categoriliste[index].img,
                  categoryName: categoriliste[index].categoryName,
                );
              },
              childCount: categoriliste.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.40,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              crossAxisCount: 2,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
