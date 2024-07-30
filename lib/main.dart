import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/chat.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const AutoFore());
}

class AutoFore extends StatelessWidget {
  const AutoFore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoFore',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/chat': (context) => const Chat(),
        '/home': (context) => Home(),
      },
    );
  }
}
