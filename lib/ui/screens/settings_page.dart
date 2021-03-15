import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: ListTile(
                    onTap: () {
                      //open edit profile
                    },
                    title: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Colors.blue,
                        ),
                        title: Text("Dili Değiştir"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                        },
                      ),
                      BuildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                        title: Text("Konumu Değiştir"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                        },
                      ),
                      BuildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: Colors.blue,
                        ),
                        title: Text("Bildirim Ayarları"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.pushNamed(context, "tosettingsnotify");
                        },
                      ),
                      BuildDivider(),
                      ListTile(
                        title: Text("Üye ol "),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
