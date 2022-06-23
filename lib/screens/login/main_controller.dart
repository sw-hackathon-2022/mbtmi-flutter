import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainController extends GetxController {
  //var list = [].obs;

  Future<void> kakaoLogin() async {
    late OAuthToken token;

    if (await isKakaoTalkInstalled()) {
      token = await UserApi.instance.loginWithKakaoTalk();
      var dio = Dio();

      var resp = await dio.get(
        "http://49.50.166.103:80/users/login",
      );
      print(resp.data);
      //list.value = resp.data;
    } else {
      token = await UserApi.instance.loginWithKakaoAccount();
      print("토큰 못받음");
    }

    // jsonDecode(source)
  }

  // MainController() {
  //   kakaoLogin();
  // }

  /*Future<void> Save(String pid) async {
    Dio dio = Dio();

    var body = <String, dynamic>{
      "pid": pid,
      "uid": "tmpuid",
    };

    await dio
        .put("http://49.50.166.103:80/",
            options: Options(
              headers: {
                "content-type": "application/json",
              },
            ),
            data: jsonEncode(body))
        .then((response) {})
        .catchError((error) => print(error));
  }

  Future<String> Upload(dynamic imageFile, String theme) async {
    print(imageFile);
    print(imageFile.path);
    String fileName = imageFile.path.split('/').last;

    FormData data = FormData.fromMap({
      "files": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });

    Dio dio = Dio();

    var resp = await dio
        .post(
      "http://49.50.166.103:80/",
      queryParameters: <String, dynamic>{
        "theme": theme,
      },
      data: data,
    )
        .then((response) {
      return response;
    }).catchError((error) => print(error));

    if (resp.statusCode == 201) {
      return resp.data as String;
    } else {
      return "error";
    }
  }

  Future<bool> Delete(String imageUrl, VoidCallback callback) async {
    print("Delete");
    print(imageUrl);
    var idx = imageUrl.lastIndexOf("pid=");
    var pid = imageUrl.substring(idx + 4);

    if (pid.isEmpty) {
      return false;
    }

    var uid = "tmpuid";

    Dio dio = Dio();
    dio.delete("http://49.50.166.103:80/", queryParameters: <String, dynamic>{
      "pid": pid,
    }).then(
      (response) {
        print(response);
        callback();
      },
    ).catchError((error) => print(error));

    return true;
    // String fileName = imageFile.path.split('/').last;

    // FormData data = FormData.fromMap({
    //   "files": await MultipartFile.fromFile(
    //     imageFile.path,
    //     filename: fileName,
    //   ),
    // });
  }*/
}
