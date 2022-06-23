import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';

var columnList = <QuestionColum>[
  QuestionColum(
    question: "나와 애인, 애인의 이성친구와 술을 마시고 있다.\n내가 먼저 취해 방에 들어가려는데,\n이때 나의 행동은?",
    press: () {},
  ),
  QuestionColum(
    question: "나와 애인, 애인의 이성친구와 술을 마시고 있다.\n내가 먼저 취해 방에 들어가려는데,\n이때 나의 행동은?",
    press: () {},
  ),
  QuestionColum(
    question: "나와 애인, 애인의 이성친구와 술을 마시고 있다.\n내가 먼저 취해 방에 들어가려는데,\n이때 나의 행동은?",
    press: () {},
  ),
];

class Qusetion extends StatelessWidget {
  const Qusetion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        // height: Get.height * 0.4,
        viewportFraction: 0.8,
        autoPlay: false,
      ),
      itemCount: columnList.length,
      itemBuilder: (context, index, realIndex) {
        return columnList[index];
      },
    );
  }

  @override
  Widget buildold(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          QuestionColum(
            question:
                "나와 애인, 애인의 이성친구와 술을 마시고 있다.\n내가 먼저 취해 방에 들어가려는데,\n이때 나의 행동은?",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          QuestionColum(
            question:
                "나와 애인, 애인의 이성친구와 술을 마시고 있다.\n내가 먼저 취해 방에 들어가려는데,\n이때 나의 행동은?",
            press: () {},
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          QuestionColum(
            question:
                "나와 애인, 애인의 이성친구와 술을 마시고 있다.\n내가 먼저 취해 방에 들어가려는데,\n이때 나의 행동은?",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class QuestionColum extends StatelessWidget {
  const QuestionColum({
    Key? key,
    required this.question,
    required this.press,
  }) : super(key: key);

  final String question;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: Get.width * 0.9,
      child: GestureDetector(
          onTap: press,
          child: Container(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(5.0) // POINT
                  ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(children: <Widget>[
                  const SizedBox(width: 6),
                  Image.asset('assets/images/contents_question.jpg',
                      width: Get.width * 0.07),
                  const SizedBox(width: 5),
                  Text(
                    question,
                    style: TextStyle(fontSize: 11),
                  ),
                ]),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 20, top: 10, bottom: 10),
                  child: Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/contents_btn.png',
                    ),
                    const Text(
                      '나 빼고 둘이 마셔도 괜찮아 ~',
                      style: TextStyle(
                        fontFamily: 'GmarketSans',
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 20, top: 10, bottom: 10),
                  child: Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'assets/images/contents_btn.png',
                    ),
                    const Text(
                      '뭐! 내가 들어가면 술 자리로 쫑이지!',
                      style: TextStyle(
                        fontFamily: 'GmarketSans',
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        '마감 3일 5시간 전',
                        style: TextStyle(
                          fontFamily: 'GmarketSans',
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
