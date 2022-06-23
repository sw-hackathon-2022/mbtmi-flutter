import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../screens/home/contents/components/background.dart';
import '../screens/home/feed/detail/avartar_widget.dart';
import '../screens/home/feed/detail/comment/comment_avartar.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser;
    // return StreamBuilder(
    //   stream: FirebaseFirestore.instance
    //       .collection('chat')
    //       .orderBy('time', descending: true)
    //       .snapshots(),
    //   builder: (context,
    //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     final chatDocs = snapshot.data!.docs;

    return Background(
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
          padding:
              EdgeInsets.only(left: Get.width * 0.07, right: Get.width * 0.07),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: kYellowColor.withOpacity(0.2), width: 1.5),
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
                    '다른 컨텐프 탭에 깻잎논쟁 투표했어?\n나 왜 떼줘도 상광 없는지 이해 안가서..ㅠㅠ\n안떼줘도 된다는 님들 이유좀 댓으로 달아줘!!\n\n참고로 나는 떼주면 안된다 파야!!그야 질투 나지\n않음??',
                    style: TextStyle(
                      fontFamily: 'GmarketSans',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                  child: SvgPicture.asset(
                                      'assets/svg/detail_heart.svg',
                                      color: Colors.red,
                                      width: Get.width * 0.08)),
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
                              GestureDetector(
                                  child: SvgPicture.asset(
                                      'assets/svg/detail_question.svg',
                                      color: kPurpleColor,
                                      width: Get.width * 0.07)),
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
        SizedBox(
          height: Get.height * 0.05,
        ),
        ListView.builder(
          reverse: false,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.01, horizontal: Get.width * 0.015),
              child: ChatListItem(
                imagePath: 'assets/images/ENFJ.png',
                userId: '#0000',
                mbti: 'ENFJ',
                text: "나도 너무 별로야..",
              ),
            );
          },
        ),
      ],
    )));
  }
  //);

}

//}
class ChatListItem extends StatelessWidget {
  ChatListItem(
      //this.time,
      {
    Key? key,
    required this.imagePath,
    required this.mbti,
    required this.userId,
    required this.text,
  }) : super(key: key);
  String imagePath;
  String userId;
  String mbti;
  String text;
  //final String time;
  //final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommentAvartar(
            imagePath: imagePath,
            userId: userId,
            mbti: mbti,
            size: const Size.fromWidth(40.0)),
        const SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
