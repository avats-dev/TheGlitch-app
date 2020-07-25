import 'package:chat_bot/services/call_service.dart';
import 'package:chat_bot/services/service_locator.dart';
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
  final CallService _service = locator<CallService>();
  final String number = "123456789";

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
      bottomNavigationBar: BottomBar(service: _service, number: number),
    );
  }
}
