import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/chat.dart';
import 'views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the generated file

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(const AutoFore());
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e.toString().contains('already exists')) {
      // Firebase is already initialized, handle accordingly
      // This is often the case during hot reloads
    } else {
      rethrow;
    }
  }
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
        '/home': (context) => const Home(),
      },
    );
  }
}
