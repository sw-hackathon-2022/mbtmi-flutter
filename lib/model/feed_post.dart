class FeedPostModel {
  final int id;
  final int authorId;
  final String title;
  final String content;
  final String mbti;
  final int like;
  final int hate;
  final String createdAt;

  FeedPostModel(
      {required this.id,
      required this.authorId,
      required this.mbti,
      required this.title,
      required this.content,
      required this.like,
      required this.hate,
      required this.createdAt});
}
