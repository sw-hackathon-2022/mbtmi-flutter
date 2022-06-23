import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvartarWidget extends StatelessWidget {
  final String imagePath;
  String userId;
  String mbti;
  String time;
  Size size;

  AvartarWidget(
      {Key? key,
      required this.imagePath,
      required this.userId,
      required this.mbti,
      required this.time,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: size.width,
            height: size.width,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(mbti,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(width: 3),
                Text(userId,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 8)),
              ],
            ),
            SizedBox(height: 3),
            Text(time,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 8)),
          ],
        ),
      ],
    );
  }
}
