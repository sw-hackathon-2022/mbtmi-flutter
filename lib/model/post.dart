class Post {
  final int id;
  final int authorId;
  final String title;
  final String content;
  final String createdAt;

  Post(
      {required this.id,
      required this.authorId,
      required this.title,
      required this.content,
      required this.createdAt});
}
