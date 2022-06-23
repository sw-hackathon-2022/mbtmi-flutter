import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    return ListView.builder(
      reverse: false,
      itemCount: 1,
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
    );
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
