import 'package:flutter/material.dart';

class AnalyticPost extends StatelessWidget {
  const AnalyticPost(
      {Key? key,
      required this.title,
      required this.mbti,
      required this.like,
      required this.hate})
      : super(key: key);

  final String title;
  final String mbti;
  final int like;
  final int hate;
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: 275,
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(6, 6), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "by. $mbti",
                style: TextStyle(fontSize: 10),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Image(
                          image: AssetImage("assets/images/post_like.png"),
                          width: 24),
                      Text(
                        like.toString(),
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  SizedBox(width: 24),
                  Column(
                    children: [
                      Image(
                          image: AssetImage("assets/images/post_hate.png"),
                          width: 24),
                      Text(
                        like.toString(),
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
