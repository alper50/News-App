import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final int istrailing;

  const MyListTile({Key key, this.istrailing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      title: Text("CNN TÜRK"),
      subtitle: Text("Cnn TÜRK haber sitesi"),
      trailing: istrailing == 1 ? FollowMeBtn() : SizedBox(),
    );
  }
}

class FollowMeBtn extends StatefulWidget {
  @override
  _FollowMeBtnState createState() => _FollowMeBtnState();
}

class _FollowMeBtnState extends State<FollowMeBtn> {
  int isfollow = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      color: isfollow == 0 ? Colors.red : Colors.white,
      child: isfollow == 0 ? Text("Takip Et") : Text("Çıkar"),
      onPressed: () {
        setState(() {
          isfollow == 0 ? isfollow = 1 : isfollow = 0;
        });
      },
    );
  }
}
