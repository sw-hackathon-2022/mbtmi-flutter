import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';
import 'package:mbtmi/model/massage_list.dart';
import 'package:mbtmi/screens/home/feed/detail/background.dart';

import '../../../../model/message_send.dart';
import 'avartar_widget.dart';
import 'comment/comment_avartar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kYellowColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/contents_32sketch.png',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                'assets/svg/feed_actionIcon.svg',
                height: Get.height * 0.04,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.01,
                      horizontal: Get.width * 0.015),
                  child: ChatListItem(
                    imagePath: 'assets/images/ENFJ.png',
                    userId: '#0000',
                    mbti: 'ENFJ',
                    text: "나도 너무 별로야..",
                  ),
                ),
                NewMessage(),
              ],
            ),
          ),
        ));
  }
}
