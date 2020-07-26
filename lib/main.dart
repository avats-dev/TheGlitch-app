import 'package:chat_bot/screens/status_screen.dart';
import 'package:chat_bot/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

void main() {
  setupLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff121212),
        backgroundColor: Color(0xff212121),
      ),
      initialRoute: StatusScreen.id,
      routes: {
        ChatScreen.id: (context) => ChatScreen(),
        StatusScreen.id: (context) => StatusScreen(),
      },
    );
  }
}
