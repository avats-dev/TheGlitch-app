import 'package:chat_bot/screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/screens/about.dart';
import 'package:chat_bot/screens/settings.dart';
import 'package:chat_bot/screens/help.dart';

class AppDrawer extends StatelessWidget {
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.redAccent[400],
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 45.0,
              left: 16.0,
              child: Text("COV-Buddy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500))),
          Positioned(
              bottom: 25.0,
              left: 16.0,
              child: Text("A friend for aiding you in this pandemic",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500))),
          Positioned(
              bottom: 10.0,
              left: 16.0,
              child: Text("An open Source Project",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Help',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Help()));
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.inbox,
              text: 'WHO',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "WHO-Covid",
                          selectedUrl:
                              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019",
                        )));
              }),
          _createDrawerItem(
              icon: Icons.inbox,
              text: 'MOHWF',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "MOHFW-Covid",
                          selectedUrl: "https://www.mohfw.gov.in/",
                        )));
              }),
          _createDrawerItem(
              icon: Icons.inbox,
              text: 'Vaccince Tracker',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyWebView(
                          title: "Covid Vaccine Tracker",
                          selectedUrl:
                              "https://covid-19tracker.milkeninstitute.org/",
                        )));
              }),
          _createDrawerItem(
              icon: Icons.stars,
              text: 'Useful Links',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setting()));
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.settings,
              text: 'Setting',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setting()));
              }),
          _createDrawerItem(
            icon: Icons.info,
            text: 'About',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(title: Text('0.0.1')),
        ],
      ),
    );
  }
}
