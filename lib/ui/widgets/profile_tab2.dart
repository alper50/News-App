import 'package:flutter/material.dart';
import 'package:haber/ui/widgets/minicard.dart';

class ProfileTabiki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MiniCard(
                  imgUrl:
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyt3.ggpht.com%2Fa%2FAATXAJx71mMaws1TKTQNVTE6eid7eT2srVe1TZ5FHA%3Ds900-c-k-c0xffffffff-no-rj-mo&f=1&nofb=1",
                  source: "CNN TÜRK",
                  newsUrl:
                      "https://i2.cnnturk.com/i/cnnturk/75/720x490/5fef75b117aca9197c453a5e",
                  title: "Kaydedilen haber Kaydedilen haber Kaydedilen haber 1",
                );
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.61,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 5.0,
              crossAxisCount: 2,
            ),
          ),
        ),
      ],
    );
  }
}
