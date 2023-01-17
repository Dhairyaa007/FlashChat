// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flashchat/chatscreen.dart';
import 'package:flashchat/login_page.dart';
import 'package:flashchat/signup_page.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xFF1F222A)),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        LoginPage.id: (context) => const LoginPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}