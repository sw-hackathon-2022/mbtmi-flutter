import 'package:flutter/material.dart';
import 'package:mbtmi/constants.dart';
import 'package:mbtmi/model/feed_post.dart';
import 'package:mbtmi/screens/home/feed/components/feed_item.dart';
import 'package:mbtmi/screens/home/feed/components/feed_list.dart';
import 'package:mbtmi/screens/home/feed/components/mbti_chip.dart';
import 'package:dio/dio.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late Future<List<FeedPostModel>> _posts;
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

  var dio = Dio();

  Future<List<FeedPostModel>> getPostsApi() async {
    var dio = Dio();
    final token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU2MjY2MDA4LCJpYXQiOjE2NTYwMDY4MDgsImp0aSI6IjNjZTgwMDY0NzRmMTRiOTk4ZTE3NTA5Njg3ZjI0NmRmIiwidXNlcl9pZCI6NX0.ISxEPnUh012qduuQgTXdWRewNRWgnVSqUSxR7mbYs9g";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    try {
      final response = await dio.get('http://49.50.166.103:80/posts/');
      final posts = (response.data['data'] as List)
          .map((e) => FeedPostModel.fromJson(e))
          .toList();
      return posts;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();

    _posts = getPostsApi();
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
                    child: FutureBuilder(
                        future: _posts,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            CircularProgressIndicator();
                          }
                          return FeedList(
                              posts: snapshot.data, filterMbti: _filterMbti);
                        }))
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
