import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  void _login() async {
    late OAuthToken token;

    if (await isKakaoTalkInstalled()) {
      token = await UserApi.instance.loginWithKakaoTalk();
    } else {
      token = await UserApi.instance.loginWithKakaoAccount();
    }

    User user = await UserApi.instance.me();

    String accessToken = token.accessToken;
    int userId = user.id;

    print("AccessToken: " + accessToken);
    print("UserID: " + userId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(onPressed: _login, child: const Text("카카오 로그인")));
  }
}
