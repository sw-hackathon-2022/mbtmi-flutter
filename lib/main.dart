import 'package:flutter/material.dart';
import 'package:mbtmi/screens/login/login_screen.dart';
import 'package:mbtmi/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: SplashScreen()); // 초기 로딩 시 Splash Screen
          //} else if (snapshot.hasError) {
          //return MaterialApp(home: ErrorScreen()); // 초기 로딩 에러 시 Error Screen
        } else {
          return MaterialApp(
            title: 'Flutter',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: snapshot.data, // 로딩 완료 시 Home Screen
            builder: (context, child) => MediaQuery(
                child: child!,
                data: MediaQuery.of(context).copyWith(
                    textScaleFactor: MediaQuery.of(context)
                        .textScaleFactor
                        .clamp(0.95, 1.05))), // 폰트 스케일 범위 고정
          );
        }
      },
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future<Widget?> initialize(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 1500));

    // . . .
    // 초기 로딩 작성
    // . . .

    return LoginScreen(); // 초기 로딩 완료 시 띄울 앱 첫 화면
  }
}
