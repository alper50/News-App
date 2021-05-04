import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final int istrailing;
  final String title;
  const MyListTile({Key key, this.istrailing, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.red,
          child: ListTile(
            visualDensity: VisualDensity(horizontal: 0,vertical: 2),
            isThreeLine: false,
        onTap: () {
          Navigator.pushNamed(
            context,
            "toweb",
            arguments: {
              "newsUrl":
                  "https://www.cnnturk.com/dunya/romada-yilbasi-kabusu-yuzlerce-kus-oldu",
              "source": "CNN TÜRK"
            },
          );
        },
        leading: Icon(
          Icons.person_outline,
        ),
        title: Text("$title"),
        trailing: istrailing == 1 ? FollowMeBtn() : SizedBox(),
      ),
    );
  }
}

class FollowMeBtn extends StatefulWidget {
  @override
  _FollowMeBtnState createState() => _FollowMeBtnState();
}

class _FollowMeBtnState extends State<FollowMeBtn> {
  bool isfollow = false;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return SizedBox(
      width: 75,
      height: 30,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.grey[300],
            width: 2.0,
          ),
        ),
        color: isfollow == false ? Colors.grey[50] : Colors.grey[300],
        child: isfollow == false ? Text("Takip Et",style: TextStyle(fontSize: 11.6),) : Text("Çıkar",style: TextStyle(fontSize: 12,color: Colors.grey[500],),),
        onPressed: () {
          setState(() {
            isfollow =!isfollow;
          });
        },
      ),
    );
  }
}
