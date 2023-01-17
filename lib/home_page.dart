import 'package:flashchat/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/Resources/flash_button.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    animation = ColorTween(begin: Colors.white, end: const Color(0xFF1F222A))
        .animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Hero(
                  tag: 'flash_logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/Flashchat.png'),
                  ),
                ),
                const Text(
                  'FLASH',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 1.5),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: FlashButton(
                    text: 'LOG IN',
                    color: const Color(0xFFFF4848),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    })),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FlashButton(
                  text: 'SIGN UP',
                  color: const Color(0xFF2D46B9),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.id);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}