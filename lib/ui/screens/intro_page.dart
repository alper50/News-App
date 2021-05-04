import 'package:flutter/material.dart';
import 'package:haber/core/provider_data/state_data.dart';
import 'package:haber/core/provider_data/theme_data.dart';

import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  final List<String> imgurl = ["intropage1", "intropage2", "intropage3"];
  final PageController pagecontroller = PageController();
  final introwords = <String>["Dünyanın her yerinden haberler","Tüm kaynaklara anında erişim","Kendi blog arşivini oluştur"];
  @override
  Widget build(BuildContext context) {
    Function pageview = Provider.of<StateData>(context).intropage;
    int page = Provider.of<StateData>(context).intropageindex;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          toolbarHeight: 50,
          title: Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.red,
                width: 3.0,
              ),
            )),
            child: Text(
              "Haber app",
            ),
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
                  Provider.of<MyThemeData>(
                    context,
                    listen: false,
                  ).updateFirstOpen();
                  // ignore: unnecessary_statements
                  page == 2 ? Navigator.pushNamed(context, "tohome") : null;
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: page == 2 ? Colors.grey[500] : Colors.grey[300],
                  ),
                  padding: page == 2
                      ? EdgeInsets.symmetric(horizontal: 75, vertical: 12)
                      : EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  child: Text(
                    "BAŞLA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: 17,
                        letterSpacing: 3,
                        color: page == 2 ? Colors.black87 : Colors.grey),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom:40.0,left:50),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 150.0,
                          child: Text(
                            introwords[index],
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
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
