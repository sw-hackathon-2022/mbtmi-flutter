import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:mbtmi/env.dart';
import 'package:mbtmi/screens/login/components/LoginButton.dart';
import 'package:mbtmi/screens/home/home_screen.dart';
import 'package:mbtmi/screens/splash/splash_screen.dart';

void main() {
  KakaoSdk.init(nativeAppKey: kakaoNativeKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 2000)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: SplashScreen());
        } else {
          return MaterialApp(
            title: 'Flutter',
            theme: ThemeData(
                primarySwatch: Colors.blue, fontFamily: "GmarketSans"),
            home: HomeScreen(),
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(child: LoginButton()));
  }
}
