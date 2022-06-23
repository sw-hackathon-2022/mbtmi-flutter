import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbtmi/screens/dialog/MbtmiDialog.dart';
import 'package:mbtmi/screens/home/home_screen.dart';
import 'package:mbtmi/screens/login/components/LoginButton.dart';
import 'package:mbtmi/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import "package:http/http.dart" as http;
import 'package:dio/dio.dart';
//import 'package:mbtmi/screens/profile/profile.dart';

class LoginScreen extends StatelessWidget {
  get json => null;

  @override
  Widget build(BuildContext context) {
    var userId = ' ';
    var authToken = ' ';
    var accessToken =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU2MjY2MDA4LCJpYXQiOjE2NTYwMDY4MDgsImp0aSI6IjNjZTgwMDY0NzRmMTRiOTk4ZTE3NTA5Njg3ZjI0NmRmIiwidXNlcl9pZCI6NX0.ISxEPnUh012qduuQgTXdWRewNRWgnVSqUSxR7mbYs9g';

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        const Image(
          image: AssetImage("assets/images/login_logo.png"),
        ),
        const SizedBox(height: 90.0),
        // LoginButton(),
        TextButton(
          onPressed: () async {
            late OAuthToken token;

            // if (await isKakaoTalkInstalled()) {
            //   token = await UserApi.instance.loginWithKakaoTalk();
            // } else {
            //   token = await UserApi.instance.loginWithKakaoAccount();
            // }
            if (await isKakaoTalkInstalled()) {
              token = await UserApi.instance.loginWithKakaoTalk();
            } else {
              token = await UserApi.instance.loginWithKakaoAccount();
            }

            print(token.idToken);

            User user = await UserApi.instance.me();

            Dio dio = Dio();
            dio.post("http://49.50.166.103:80/users/login/",
                queryParameters: <String, dynamic>{
                  "userId": user.id,
                  "accessToken": token.accessToken,
                }).then(
              (response) {
                print(response);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileScreen(token: token.accessToken)));
              },
            ).catchError((error) => print(error));
          },
          child: Container(
              width: 250, child: Image.asset("assets/images/login_kakao.png")),
        ),
      ],
    ));
  }
}
