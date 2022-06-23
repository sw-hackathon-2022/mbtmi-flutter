import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';

class ImageContent extends StatefulWidget {
  const ImageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageContent> createState() => _ImageContentState();
}

class _ImageContentState extends State<ImageContent> {
  final Images = [
    'assets/images/content_02.png',
    'assets/images/content_01.png',
    'assets/images/content_03.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: Get.height * 0.3,
        viewportFraction: 0.7,
        autoPlay: false,
      ),
      itemCount: Images.length,
      itemBuilder: (context, index, realIndex) {
        final urlImage = Images[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          child: Image.asset(urlImage, fit: BoxFit.cover),
        );
      },
    );
  }
}

class YoutubePhoto extends StatelessWidget {
  const YoutubePhoto({
    Key? key,
    required this.image,
    required this.press,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;
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
      width: Get.width * 0.36,
      child: GestureDetector(
          onTap: press,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.0) // POINT
                  ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 5),
                  Container(
                    child: Image.asset(image),
                    width: Get.width * 0.35,
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(title,
                        style: TextStyle(
                            color: kPurpleColor,
                            fontFamily: 'GmarketSans',
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: const Text(
                      'by. 과몰입',
                      style: TextStyle(
                        fontFamily: 'GmarketSans',
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: const Text(
                      '22.06.20',
                      style: TextStyle(
                        fontFamily: 'GmarketSans',
                        fontSize: 8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ]),
          )),
    );
  }
}
