class AnalyticPostModel {
  final int id;
  final String title;
  final String mbti;
  final int like;
  final int hate;

  AnalyticPostModel(
      {required this.id,
      required this.mbti,
      required this.title,
      required this.like,
      required this.hate});
}
