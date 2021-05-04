import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/home_template.dart';

class HomePageBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map argmnts = ModalRoute.of(context).settings.arguments;
    return HomePage(
        api: argmnts["api"],
        title: argmnts["title"],
      );
  }
}
