import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Help'),
          backgroundColor: Colors.redAccent[400],
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(20),
                      child: Center(child: Text('Call an Ambulance')),
                    )),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      print('taped');
                    },
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(20),
                      child: Center(child: Text('Call 1075 TOLL-FREE')),
                    )),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          print('taped');
                        },
                        child: Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(20),
                          child: Center(child: Text('Call 1075 TOLL-FREE')),
                        )),
                    GestureDetector(
                        onTap: () {
                          print('taped');
                        },
                        child: Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(20),
                          child: Center(child: Text('Call 1075 TOLL-FREE')),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
