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
                  const Text('?????? ?????? ?????? ????????????! ??????!\n',
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
                    '?????? ????????? ?????? ???????????? ?????????????\n??? ??? ????????? ?????? ????????? ?????? ?????????..??????\n???????????? ????????? ?????? ????????? ????????? ?????????!!\n\n????????? ?????? ????????? ????????? ??????!!?????? ?????? ??????\n????????',
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
                                '???????????? : ',
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
                                '????????? ????????? : ',
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
                text: "?????? ?????? ?????????..",
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
            size: const Size.fromWidth(30.0)),
        const SizedBox(
          width: 5,
        ),
        Text(text,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10)),
      ],
    );
  }
}
