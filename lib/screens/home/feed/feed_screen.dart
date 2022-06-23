import 'package:flutter/material.dart';
import 'package:mbtmi/constants.dart';
import 'package:mbtmi/model/feed_post.dart';
import 'package:mbtmi/screens/home/feed/components/feed_item.dart';
import 'package:mbtmi/screens/home/feed/components/feed_list.dart';
import 'package:mbtmi/screens/home/feed/components/mbti_chip.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late List<FeedPostModel> _posts;
  List<String> _filterMbti = ["E", "I", "N", "S", "F", "T", "J", "P"];

  void setFilter(String char) {
    if (_filterMbti.contains(char))
      setState(() {
        _filterMbti.remove(char);
      });
    else
      setState(() {
        _filterMbti.add(char);
      });
  }

  @override
  void initState() {
    super.initState();
    _posts = [
      FeedPostModel(
          id: 0,
          authorId: 0000,
          mbti: "ENFJ",
          title: "이거 다른 의견 궁금하다! 집합!",
          content:
              "다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어?",
          like: 1234,
          hate: 1234,
          createdAt: "5분 전"),
      FeedPostModel(
          id: 0,
          authorId: 0000,
          mbti: "ESTJ",
          title: "이거 다른 의견 궁금하다! 집합!",
          content:
              "다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어?",
          like: 1234,
          hate: 1234,
          createdAt: "5분 전"),
      FeedPostModel(
          id: 0,
          authorId: 0000,
          mbti: "ENTP",
          title: "이거 다른 의견 궁금하다! 집합!",
          content:
              "다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어?",
          like: 1234,
          hate: 1234,
          createdAt: "5분 전"),
      FeedPostModel(
          id: 0,
          authorId: 0000,
          mbti: "INFP",
          title: "이거 다른 의견 궁금하다! 집합!",
          content:
              "다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어? 다들 컨텐츠 탭에 깻잎논쟁 투표 했어?",
          like: 1234,
          hate: 1234,
          createdAt: "5분 전")
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  color: kYellowColor,
                  height: size.height * 0.2,
                  width: size.width,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 42),
                        Image(
                          image: AssetImage("assets/images/profile/ENFJ.png"),
                          width: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("ENFJ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                            SizedBox(width: 4),
                            Text("#0000",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 8)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Image(image: AssetImage("assets/images/feed_header.png")),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MbtiChip(
                          leftText: "E",
                          rightText: "I",
                          isLeftChecked: _filterMbti.contains("E"),
                          isRightChecked: _filterMbti.contains("I"),
                          onLeftClick: () {
                            setFilter("E");
                          },
                          onRightClick: () {
                            setFilter("I");
                          }),
                      MbtiChip(
                          leftText: "N",
                          rightText: "S",
                          isLeftChecked: _filterMbti.contains("N"),
                          isRightChecked: _filterMbti.contains("S"),
                          onLeftClick: () {
                            setFilter("N");
                          },
                          onRightClick: () {
                            setFilter("S");
                          }),
                      MbtiChip(
                          leftText: "F",
                          rightText: "T",
                          isLeftChecked: _filterMbti.contains("F"),
                          isRightChecked: _filterMbti.contains("T"),
                          onLeftClick: () {
                            setFilter("F");
                          },
                          onRightClick: () {
                            setFilter("T");
                          }),
                      MbtiChip(
                          leftText: "J",
                          rightText: "P",
                          isLeftChecked: _filterMbti.contains("J"),
                          isRightChecked: _filterMbti.contains("P"),
                          onLeftClick: () {
                            setFilter("J");
                          },
                          onRightClick: () {
                            setFilter("P");
                          })
                    ],
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                    height: 500,
                    child: FeedList(posts: _posts, filterMbti: _filterMbti))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage("assets/images/appbar_logo.png"),
                      width: 60,
                    ),
                    Image(
                      image: AssetImage("assets/images/add_post.png"),
                      width: 36,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
