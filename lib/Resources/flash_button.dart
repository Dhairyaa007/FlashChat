import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  String text = '';
  Color color;
  dynamic onPressed;
  FlashButton(
      {required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }
}