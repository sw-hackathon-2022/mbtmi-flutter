import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mbtmi/screens/dialog/MbtmiDialog.dart';
import 'package:mbtmi/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:mbtmi/screens/write/write_screen.dart';

const double _kItemExtent = 32.0;
const List<String> _mbtis = [
  "ISTJ",
  "ISFJ",
  "INFJ",
  "INTJ",
  "ISTP",
  "ISFP",
  "INFP",
  "INTP",
  "ESTP",
  "ESFP",
  "ENFP",
  "ENTP",
  "ESTJ",
  "ESFJ",
  "ENFJ",
  "ENTJ"
];

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<ProfileScreen> createState() => _ProfileScreenSate();
}

class _ProfileScreenSate extends State<ProfileScreen> {
  int _selected = 0;
  String text = " ";

  @override
  Widget build(BuildContext context) {
    String _selectedMbti = _mbtis[_selected];
    // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
    void _showDialog(Widget child) {
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => Container(
                height: 216,
                padding: const EdgeInsets.only(top: 6.0),
                // The Bottom margin is provided to align the popup above the system navigation bar.
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                // Provide a background color for the popup.
                color: CupertinoColors.systemBackground.resolveFrom(context),
                // Use a SafeArea widget to avoid system overlaps.
                child: SafeArea(
                  top: false,
                  child: child,
                ),
              ));
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/profile_logo.png"),
                height: 90,
              ),
              const Image(
                  width: 310,
                  image: AssetImage(
                      "assets/images/profile_text.png")), // "매우 간단한 프로필 작성" 이미지
              const SizedBox(height: 30),
              Image(
                  height: 180,
                  image: AssetImage(
                      "assets/images/profile/$_selectedMbti.png")), // 프로필 이미지
              GestureDetector(
                onTap: () => _showDialog(
                  CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selected) {
                      setState(() {
                        _selected = selected;
                      });
                    },
                    children: List<Widget>.generate(_mbtis.length, (int index) {
                      return Center(
                        child: Text(
                          _mbtis[index],
                        ),
                      );
                    }),
                  ),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(_selectedMbti,
                      style: TextStyle(
                          fontFamily: "GmarketSans",
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.arrow_drop_down_circle)
                ]),
              ), // 다이얼로그
              SizedBox(height: 20),
              Container(
                  width: 180,
                  child: Material(
                      child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        label: const Center(
                      child: Text("소개를 입력하세요"),
                    )),
                  ))), // 한 줄 소개
              const SizedBox(height: 80),
              TextButton(
                onPressed: () async {
                  User user = await UserApi.instance.me();

                  Dio dio = Dio();
                  dio.post("http://49.50.166.103:80/users/profile/",
                      queryParameters: <String, dynamic>{
                        "mbti": _selectedMbti,
                        "about": "string",
                      }).then(
                    (response) {
                      print(response);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(mbti: _selectedMbti)));
                    },
                  ).catchError((error) => print(error));

                  //showMbtmiDialog(context, "환영합니다!",
                  //"엠비티엠아이에 오신 것을 환영합니다!\n자신의 TMI를 맘껏 방출해보세요!");
                },
                child: Container(
                    width: 260,
                    child: Image.asset("assets/images/profile_start.png")),
              ), // 시작하기 버튼
            ]),
      ),
    ));
  }
}
