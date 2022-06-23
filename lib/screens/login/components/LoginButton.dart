import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import "package:http/http.dart" as http;
import 'package:dio/dio.dart';

import '../../profile/profile_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  Future<int?> _login() async {
    // if (resp.statusCode == 200) {
    // print("하하하");
    // var dio2 = Dio();

    // var resp = await dio2.get(
    //   "http://49.50.166.103:80/users/login/callback",
    // );

    // print("냠냠2");
    // print(resp.statusCode);
    // print(resp.data);
    // User user = await UserApi.instance.me();

    // String accessToken = token.accessToken;
    // int userId = user.id;

    // print("AccessToken: " + accessToken);
    // print("UserID: " + userId.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    var userId = ' ';
    var authToken = ' ';

    return (ElevatedButton(
        onPressed: () async {
          late OAuthToken token;

          if (await isKakaoTalkInstalled()) {
            token = await UserApi.instance.loginWithKakaoTalk();
          } else {
            token = await UserApi.instance.loginWithKakaoAccount();
          }
          print(token);
          Dio dio = Dio();
          dio.post("http://49.50.166.103:80/users/login/",
              queryParameters: <String, dynamic>{
                "userId": userId,
                "accessToken": token.accessToken,
              }).then(
            (response) {
              print(response);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ProfileScreen(
              //               token: token.accessToken,
              //             )));
            },
          ).catchError((error) => print(error));
        },
        child: const Text("카카오 로그인")));
  }
}
