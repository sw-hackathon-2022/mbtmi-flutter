import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Image(image: AssetImage("assets/images/splash_background.png")),
      Padding(
        padding: const EdgeInsets.only(left: 36, top: 300),
        child: RichText(
          text: TextSpan(
              children: [
                TextSpan(text: "다른 사람들과\n"),
                TextSpan(text: "함께하는\n\n"),
                TextSpan(
                    text: "내 성격 TMI\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "대.방.출\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontFamily: "GmarketSans")),
        ),
      )
    ]));
  }
}
