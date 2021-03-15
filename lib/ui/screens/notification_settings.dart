import 'package:flutter/material.dart';

class NotifySetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                "Notification Settings",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SwitchListTile(
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.all(0),
                        value: true,
                        title: Text("Received notification"),
                        onChanged: (val) {},
                      ),
                      SwitchListTile(
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.all(0),
                        value: false,
                        title: Text("Received newsletter"),
                        onChanged: null,
                      ),
                      SwitchListTile(
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.all(0),
                        value: true,
                        title: Text("Received Offer Notification"),
                        onChanged: (val) {},
                      ),
                      SwitchListTile(
                        activeColor: Colors.blue,
                        contentPadding: const EdgeInsets.all(0),
                        value: true,
                        title: Text("Received App Updates"),
                        onChanged: null,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
