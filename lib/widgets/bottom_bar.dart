import 'package:chat_bot/screens/chat_screen.dart';
import 'package:chat_bot/services/call_service.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final String number;
  final CallService service;

  BottomBar({this.number, this.service});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.call), title: Text('HELP')),
        BottomNavigationBarItem(
            icon: Icon(Icons.group), title: Text('CHATBOT')),
      ],
      backgroundColor: Colors.redAccent[400],
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      onTap: (index) {
        if (index == 0) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.redAccent[400],
              title: Text('HELP'),
              content: Text('Call - $number'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => service.call(number),
                ),
              ],
            ),
            barrierDismissible: true,
          );
        } else
          Navigator.pushNamed(context, ChatScreen.id);
      },
    );
  }
}
