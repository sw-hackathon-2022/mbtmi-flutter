import 'package:flutter/material.dart';
import 'package:mbtmi/screens/home/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenSate();
}

class _ProfileScreenSate extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String mbti = "ENFJ";
    String profile_path = "assets/images/profile/$mbti.png";

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 90,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Image(
            image: AssetImage("assets/images/profile_logo.png"),
            height: 90,
          ) // 앱바 로고
          ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Image(
            width: 320,
            image: AssetImage(
                "assets/images/profile_text.png")), // "매우 간단한 프로필 작성" 이미지
        const SizedBox(height: 30),
        Image(height: 180, image: AssetImage(profile_path)), // 프로필 이미지
        Text("ENFJ",
            style: TextStyle(
                fontFamily: "GmarketSans",
                fontSize: 32,
                fontWeight: FontWeight.bold)), // 다이얼로그
        SizedBox(height: 20),
        Container(
            width: 230,
            child: TextField(
              decoration: InputDecoration(
                  label: const Center(
                child: Text("소개를 입력하세요"),
              )),
            )), // 한 줄 소개
        const SizedBox(height: 80),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Container(
              width: 260,
              child: Image.asset("assets/images/profile_start.png")),
        ), // 시작하기 버튼
      ]),
    );
  }
}
