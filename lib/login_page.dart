import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat/Resources/flash_button.dart';
import 'package:flashchat/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'Resources/constants.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loader = false;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: loader,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: Hero(
                        tag: 'flash_logo',
                        child: SizedBox(
                          height: 150.0,
                          child: Image.asset('images/Flashchat.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email'),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password'),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Material(
                      child: FlashButton(
                          text: 'LOG IN',
                          color: const Color(0xFFFF4848),
                          onPressed: () async {
                            setState(() {
                              loader = true;
                            });
                            try {
                              final loggedInUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              Navigator.pushNamed(context, ChatScreen.id);
                              setState(() {
                                loader = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          }),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}