import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';
import 'package:mbtmi/model/massage_list.dart';
import 'package:mbtmi/screens/home/feed/detail/background.dart';
import 'package:mbtmi/screens/home/feed/detail/ques_controller.dart';

import '../../../../model/message_send.dart';
import '../../../dialog/MbtmiDialog.dart';
import '../../../dialog/MbtmiDialog2.dart';
import 'avartar_widget.dart';
import 'comment/comment_avartar.dart';
import 'heart_controller.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key) {
    Get.put(HeartController());
    Get.put(QuestController());
  }

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
            GestureDetector(
              onTap: () => showMbtmiDialog2(context, '신고 사유 선택'),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  'assets/svg/feed_actionIcon.svg',
                  height: Get.height * 0.04,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Background(
            child: SingleChildScrollView(
                child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: Get.height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.045, right: Get.width * 0.045),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvartarWidget(
                      imagePath: 'assets/images/ENFJ.png',
                      userId: '#0000',
                      mbti: 'ENFJ',
                      time: '22.06.22 20:00',
                      size: const Size.fromWidth(45.0)),
                  const Icon(
                    CupertinoIcons.ellipsis_vertical,
                    color: kYellowColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.07, right: Get.width * 0.07),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: kYellowColor.withOpacity(0.2), width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(5.0) // POINT
                      ),
                ),
                width: Get.width * 0.85,
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 15),
                      const Text('이거 다른 의견 궁금하다! 집합!\n',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'GmarketSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                          textAlign: TextAlign.left),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '다른 컨텐프 탭에 깻잎논쟁 투표했어?\n나 왜 떼줘도 상광 없는지 이해 안가서..ㅠㅠ\n안떼줘도 된다는 님들 이유좀 댓으로 달아줘!!\n\n참고로 나는 떼주면 안된다 파야!! 그야 질투 나지\n않음??',
                        style: TextStyle(
                          fontFamily: 'GmarketSans',
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: [
                                  GetBuilder<HeartController>(
                                      builder: (controller) {
                                    if (controller.pageIdx.value == 1) {
                                      return IconButton(
                                        icon: SvgPicture.asset(
                                            'assets/svg/detail_heart.svg',
                                            width: Get.width * 0.06,
                                            color: Colors.red),
                                        onPressed: () async {
                                          controller.changeColor(1);
                                          print("1");
                                        },
                                      );
                                    } else {
                                      return IconButton(
                                        icon: SvgPicture.asset(
                                            'assets/svg/detail_heart_off.svg',
                                            width: Get.width * 0.06,
                                            color: Colors.black),
                                        onPressed: () async {
                                          controller.changeColor(1);
                                        },
                                      );
                                    }
                                  }),
                                  const Text(
                                    '공감해요 : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'GmarketSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                  const Text(
                                    '1,234',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'GmarketSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              child: Row(
                                children: [
                                  GetBuilder<QuestController>(
                                      builder: (controller) {
                                    if (controller.pageIdx.value == 1) {
                                      return IconButton(
                                        icon: SvgPicture.asset(
                                            'assets/svg/detail_question.svg',
                                            width: Get.width * 0.06,
                                            color: kPurpleColor),
                                        onPressed: () async {
                                          controller.changeColor(1);
                                          print("1");
                                        },
                                      );
                                    } else {
                                      return IconButton(
                                        icon: SvgPicture.asset(
                                            'assets/svg/detail_question_off.svg',
                                            width: Get.width * 0.06,
                                            color: Colors.black),
                                        onPressed: () async {
                                          controller.changeColor(1);
                                        },
                                      );
                                    }
                                  }),
                                  const Text(
                                    '이해가 안돼요 : ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'GmarketSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                  const Text(
                                    '1,234',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'GmarketSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.05, right: Get.width * 0.05),
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Get.height * 0.01,
                          horizontal: Get.width * 0.015),
                      child: Stack(alignment: Alignment.center, children: [
                        Image.asset(
                          'assets/images/detail_comment_.png',
                          width: Get.width * 0.75,
                        ),
                        ChatListItem(
                          imagePath: 'assets/images/profile/ISFP.png',
                          userId: '#0210',
                          mbti: 'ISFP',
                          text: "     깻잎 떼주는건 사랑이지 ㅠㅠ",
                        ),
                      ]),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.015),
                      child: Stack(alignment: Alignment.center, children: [
                        Image.asset(
                          'assets/images/detail_comment_.png',
                          width: Get.width * 0.75,
                        ),
                        ChatListItem(
                          imagePath: 'assets/images/profile/ISFJ.png',
                          userId: '#2200',
                          mbti: 'ISFJ',
                          text:
                              "     근데 뭐 그럴 수도 있는거 아닐까..?\n     봤는데 무시하는 것도 이상해..! ㅋㅋ",
                        ),
                      ]),
                    ),
                    NewMessage(),
                  ],
                ),
              ),
            ),
          ],
        ))));
  }
}
