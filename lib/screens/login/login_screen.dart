import 'package:flutter/material.dart';
import 'package:mbtmi/screens/dialog/MbtmiDialog.dart';
import 'package:mbtmi/screens/home/home_screen.dart';
import 'package:mbtmi/screens/login/components/LoginButton.dart';
import 'package:mbtmi/screens/profile/profile.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        const Image(
          image: AssetImage("assets/images/login_logo.png"),
        ),
        const SizedBox(height: 90.0),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
            showMbtmiDialog(
                context, "환영합니다!", "엠비티엠아이에 오신 것을 환영합니다!\n나의 TMI를 맘껏 방출해보세요~");
          },
          child: Container(
              width: 250, child: Image.asset("assets/images/login_kakao.png")),
        ),
      ],
    ));
  }
}
