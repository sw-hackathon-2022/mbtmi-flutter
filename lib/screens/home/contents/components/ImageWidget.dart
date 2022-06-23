import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          YoutubePhoto(
            image: "assets/images/image1.png",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          YoutubePhoto(
            image: "assets/images/image2.png",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          YoutubePhoto(
            image: "assets/images/image3.png",
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
            ]),
          )),
    );
  }
}
