import 'package:flutter/material.dart';
import 'package:mbtmi/constants.dart';
import 'package:mbtmi/model/analytic_post.dart';
import 'package:mbtmi/model/post.dart';
import 'package:mbtmi/screens/home/analytic/components/analytic_post.dart';
import 'package:mbtmi/screens/home/analytic/components/doughnut_chart.dart';
import 'package:mbtmi/screens/home/analytic/components/radial_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticScreen> createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {
  late List<AnalyticPostModel> _posts;

  @override
  void initState() {
    super.initState();
    _posts = [
      AnalyticPostModel(
          id: 0, mbti: "INTP", title: "내일 점심 뭐먹지? ㅊㅊ좀", like: 2222, hate: 2222),
      AnalyticPostModel(
          id: 1, mbti: "INTP", title: "윗글 마라탕이나 드셈", like: 2222, hate: 2222),
      AnalyticPostModel(
          id: 2, mbti: "INTP", title: "마라탕이 뭐임 꿔바로우도", like: 2222, hate: 2222)
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Image(
            image: AssetImage("assets/images/appbar_logo.png"),
            width: 60,
          ),
          centerTitle: false,
          backgroundColor: kGreenColor,
          elevation: 0,
        ),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: kGreenColor,
            expandedHeight: size.height * 0.64,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                Positioned(
                  left: 36,
                  top: 36,
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(
                              children: [
                            TextSpan(text: "지금 "),
                            TextSpan(
                                text: "ENFJ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "에게\n"),
                            TextSpan(
                                text: "HOT",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "한 "),
                            TextSpan(
                                text: "게시글",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "은?")
                          ],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: "GmarketSans"))),
                      SizedBox(height: 48),
                      Column(
                          children: List.generate(
                              _posts.length,
                              (index) => AnalyticPost(
                                  title: _posts[index].title,
                                  mbti: _posts[index].mbti,
                                  like: _posts[index].like,
                                  hate: _posts[index].hate))),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 48,
                maxHeight: 48,
                child: Stack(
                  children: [
                    Image(
                        image: AssetImage("assets/images/analytic_header.png"))
                  ],
                ),
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: RichText(
                        text: TextSpan(
                            children: [
                          TextSpan(
                              text: "ENFJ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "가\n"),
                          TextSpan(text: "가장 많이 반응한\n"),
                          TextSpan(
                              text: "MBTI",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "는?"),
                        ],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontFamily: "GmarketSans"))),
                  ),
                  DoughnutChart(),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: RichText(
                        text: TextSpan(
                            children: [
                          TextSpan(
                              text: "ENFJ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "에게\n"),
                          TextSpan(text: "가장 많이 반응한\n"),
                          TextSpan(
                              text: "MBTI",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "는?"),
                        ],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontFamily: "GmarketSans"))),
                  ),
                  RadialBar()
                ]),
              ]),
            ),
          )
        ]));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  // 2
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  // 3
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
