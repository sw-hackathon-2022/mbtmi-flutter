import 'package:flutter/material.dart';
import 'package:mbtmi/model/feed_post.dart';

import 'feed_item.dart';

class FeedList extends StatelessWidget {
  const FeedList({Key? key, required this.posts, required this.filterMbti})
      : super(key: key);

  final List<FeedPostModel> posts;
  final List<String> filterMbti;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(
              posts.length,
              (index) =>
                  (filterMbti.isNotEmpty && isOK(posts[index].author.mbti)
                      ? FeedItem(post: posts[index])
                      : Container()))),
    );
  }

  bool isOK(String mbti) {
    for (int i = 0; i < mbti.length; i++) {
      if (!filterMbti.contains(mbti[i])) return false;
    }
    return true;
  }
}
