import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';
import 'package:mbtmi/screens/home/contents/components/background.dart';

import 'components/question.dart';
import 'components/youtube.dart';

class ContentsScreen extends StatelessWidget {
  const ContentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPurpleColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/contents_32sketch.png',
            ),
          ),
        ),
        body: Background(
            child: SingleChildScrollView(
                child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: Get.height * 0.06,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text('오늘의',
                    style: TextStyle(
                        color: kPurpleColor,
                        fontFamily: 'GmarketSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                    textAlign: TextAlign.left),
                Text('추천 콘텐츠',
                    style: TextStyle(
                        color: kPurpleColor,
                        fontFamily: 'GmarketSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                    textAlign: TextAlign.left),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Qusetion(),
            const SizedBox(
              height: 30,
            ),
            Youtube(),
            const SizedBox(
              height: 30,
            ),
            Qusetion(),
            const SizedBox(
              height: 40,
            ),
          ],
        ))));
  }
}
