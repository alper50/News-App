import 'package:flutter/material.dart';
import 'package:haber/core/models/search_model.dart';
import 'package:haber/core/service/getsearch.dart';

class SearchWidget extends SearchDelegate {
  @override
  String get searchFieldLabel => "Arama Yap";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear_rounded),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_rounded),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<SearchModel> datas = [];
    Future<dynamic> getNews() async {
      datas = [];
      if (query.length > 1) {
        await Searcheddata.getSearch(query).then((List<SearchModel> data) {
          datas.addAll(data);
        });
        return datas;
      }
    }

    return FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (datas.isEmpty) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'Uygun sonuç bulunamadı',
                  style: TextStyle(fontSize: 25,),
                ),
              );
            }
            return ListView.builder(
                itemCount: datas.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(datas[index].title),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "toweb",
                        arguments: {
                          "newsUrl": datas[index].link,
                          "source": "Arama Sonucu"
                        },
                      );
                    },
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
        // child: FutureBuilder(
        //   future: getNews(),
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.waiting:
        //         return Center(child: CircularProgressIndicator());
        //       default:
        //         if (snapshot.hasError) {
        //           return Container(
        //             color: Colors.black,
        //             alignment: Alignment.center,
        //             child: Text(
        //               'Bir yerde sorun var :) -- ${snapshot.error}',
        //               style: TextStyle(
        //                 fontSize: 28,
        //                 color: Colors.white,
        //               ),
        //             ),
        //           );
        //         } else {
        //           if (snapshot.data.isEmpty) {
        //             return Container(
        //               color: Colors.black,
        //               alignment: Alignment.center,
        //               child: Text(
        //                 'Uygun sonuç bulunamadı',
        //                 style: TextStyle(fontSize: 28, color: Colors.white),
        //               ),
        //             );
        //           } else {
        //             return ListTile(
        //               leading: Icon(
        //                 Icons.search_rounded,
        //               ),
        //               title: Text(
        //                 "${snapshot.data.link}",
        //               ),
        //             );
        //           }
        //         }
        //     }
        //   },
        // ),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.help_center),
        title: Text("Anahtar kelimenin bulunduğu tüm haberlerin getirildiğini unutmayın",style:TextStyle(fontSize:14,)),
      ),
    );
  }

}
