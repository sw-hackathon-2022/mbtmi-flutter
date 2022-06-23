import 'package:dio/dio.dart';

class FeedPostModel {
  final int id;
  Author author;
  final String title;
  final String content;
  Reactions reactions;
  final String createdAt;

  FeedPostModel(
      {required this.id,
      required this.author,
      required this.title,
      required this.content,
      required this.reactions,
      required this.createdAt});

  factory FeedPostModel.fromJson(Map<String, dynamic> parsedjson) {
    return FeedPostModel(
        id: parsedjson['id'],
        author: Author.fromJson(parsedjson['author']),
        title: parsedjson['title'],
        content: parsedjson['content'],
        reactions: Reactions.fromJson(parsedjson['reactions']),
        createdAt: parsedjson['createdAt']);
  }
}

class Author {
  late String username;
  late String mbti;

  Author({required this.username, required this.mbti});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username'], mbti: json['mbti']);
  }
}

class Reactions {
  int likeCount;
  int unlikeCount;

  Reactions({required this.likeCount, required this.unlikeCount});
  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(
        likeCount: json['like_count'], unlikeCount: json['unlike_count']);
  }
}

/*
class FeedPostModel {
  final int id;
  final String authorUsername;
  final String authorMbti;
  final String title;
  final String content;
  final int likeCount;
  final int unlikeCount;
  final String createdAt;

  FeedPostModel(
      {required this.id,
      required this.authorUsername,
      required this.authorMbti,
      required this.title,
      required this.content,
      required this.likeCount,
      required this.unlikeCount,
      required this.createdAt});

  FeedPostModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        authorUsername = json['username'],
        authorMbti = json['mbti'],
        title = json['title'],
        content = json['content'],
        likeCount = json['likeCount'],
        unlikeCount = json['unlikeCount'],
        createdAt = json['createdAt'];
}
*/