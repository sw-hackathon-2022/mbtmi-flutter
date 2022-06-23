import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:mbtmi/constants.dart';
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
                primarySwatch: _createMaterialColor(kYellowColor),
                fontFamily: "GmarketSans"),
            home: HomeScreen(),
          );
        }
      },
    );
  }
}

MaterialColor _createMaterialColor(Color color) {
  List<double> strengths = [.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
