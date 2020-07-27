import 'package:flutter/material.dart';
import 'package:chat_bot/widgets/pie_chart.dart';
import 'package:chat_bot/widgets/bottom_bar.dart';
import 'package:chat_bot/widgets/drawer.dart';

class StatusScreen extends StatefulWidget {
  static String id = 'status_screen';

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
 final String number = "1075";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COV - Buddy'),
        centerTitle: true,
        backgroundColor: Colors.redAccent[400],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Pie(),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomBar(number: number),
    );
  }
}
