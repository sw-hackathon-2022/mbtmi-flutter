import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentAvartar extends StatelessWidget {
  final String imagePath;
  String userId;
  String mbti;

  Size size;

  CommentAvartar(
      {Key? key,
      required this.imagePath,
      required this.userId,
      required this.mbti,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: size.width,
            height: size.width,
            fit: BoxFit.fill,
          ),
        ),
        Text(mbti,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
        SizedBox(
          height: 3,
        ),
        Text(userId,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 6)),
      ],
    );
  }
}
