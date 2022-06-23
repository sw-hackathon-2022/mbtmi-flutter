import 'package:flutter/material.dart';
import 'package:mbtmi/model/feed_post.dart';
import 'package:mbtmi/model/post.dart';
import 'package:mbtmi/screens/home/feed/detail/detail_screen.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({Key? key, required this.post}) : super(key: key);

  final FeedPostModel post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailScreen()));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: (Row(
          children: [
            Expanded(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/profile/${post.mbti}.png"),
                          width: 40,
                        ),
                        Text(post.mbti,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        SizedBox(width: 4),
                        Text("#${post.authorId}",
                            style: TextStyle(color: Colors.grey, fontSize: 10))
                      ],
                    ),
                    Text(post.createdAt,
                        style: TextStyle(color: Colors.grey, fontSize: 10))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xfffff9e9),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.title,
                          style: TextStyle(fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 12),
                      Text(post.content,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 10),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis)
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(width: 12),
            Column(
              children: [
                SizedBox(height: 24),
                Image(
                    image: AssetImage("assets/images/post_like.png"),
                    width: 26),
                Text(post.like.toString(), style: TextStyle(fontSize: 10))
              ],
            ),
            SizedBox(width: 16),
            Column(
              children: [
                SizedBox(height: 23),
                Image(
                  image: AssetImage("assets/images/post_hate.png"),
                  width: 24,
                ),
                Text(post.hate.toString(), style: TextStyle(fontSize: 10))
              ],
            )
          ],
        )),
      ),
    );
  }
}
