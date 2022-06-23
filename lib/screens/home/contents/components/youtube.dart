import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';

class Youtube extends StatelessWidget {
  const Youtube({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          YoutubePhoto(
            image: "assets/images/contents_youtube1.jpg",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          YoutubePhoto(
            image: "assets/images/contents_youtube1.jpg",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          YoutubePhoto(
            image: "assets/images/contents_youtube1.jpg",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          YoutubePhoto(
            image: "assets/images/contents_youtube1.jpg",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
        ],
      ),
    );
  }
}

class YoutubePhoto extends StatelessWidget {
  const YoutubePhoto({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 5,
        bottom: 5,
      ),
      width: Get.width * 0.4,
      child: GestureDetector(
          onTap: press,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.0) // POINT
                  ),
            ),
            child: Column(children: <Widget>[
              const SizedBox(height: 5),
              Container(
                child: Image.asset(image),
                width: Get.width * 0.35,
              ),
              const SizedBox(height: 5),
              const Text('저녁은 치킨인가,\n피자인가, 그것이...',
                  style: TextStyle(
                      color: kPurpleColor,
                      fontFamily: 'GmarketSans',
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'by. 과몰입',
                style: TextStyle(
                  fontFamily: 'GmarketSans',
                  fontSize: 8,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '22.06.20',
                style: TextStyle(
                  fontFamily: 'GmarketSans',
                  fontSize: 8,
                ),
              ),
              const SizedBox(height: 5),
            ]),
          )),
    );
  }
}
