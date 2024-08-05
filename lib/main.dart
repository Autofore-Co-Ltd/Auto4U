import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/login_screen.dart';
import 'views/signup_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/chat': (context) => const Chat(),
        '/home': (context) => Home(),
      },
    );
  }
}
