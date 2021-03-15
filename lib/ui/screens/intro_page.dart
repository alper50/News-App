import 'package:flutter/material.dart';
import 'package:haber/core/provider_data/state_data.dart';

import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  final List<String> imgurl = ["intropage1", "intropage2", "intropage3"];
  final PageController pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    Function pageview = Provider.of<StateData>(context).intropage;
    int page = Provider.of<StateData>(context).intropageindex;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: Text(
            "Haber app",
          ),
        ),
        bottomNavigationBar: Container(
          height: 110,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  3,
                  (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == page) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == page)
                            ? Colors.grey
                            : Colors.grey.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  // ignore: unnecessary_statements
                  page == 2 ? Navigator.pushNamed(context, "tohome") : null;
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color:page == 2 ? Colors.grey[500]: Colors.grey[300],
                  ),
                  padding: page == 2
                      ? EdgeInsets.symmetric(horizontal: 85, vertical: 12)
                      : EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  child: Text(
                    "ATLA",
                    style: TextStyle(fontSize: 17, letterSpacing: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: PageView.builder(
          onPageChanged: (index) {
            pageview(index);
          },
          physics: BouncingScrollPhysics(),
          controller: pagecontroller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "images/${imgurl[index]}.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: AnimatedOpacity(
                        opacity: 1,
                        duration: Duration(milliseconds: 150),
                        child: Text("Deneme sayfası ${index + 1}"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
