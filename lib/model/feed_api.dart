import 'package:dio/dio.dart';
import 'package:mbtmi/model/feed_post.dart';

class FeedPostApi {
  var dio = Dio();

  FeedPostApi({required this.dio});

  Future<Response> getPostsApi() async {
    var dio = Dio();
    try {
      final response = await dio.get('http://49.50.166.103:80/posts/');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

class FeedPostRepository {
  final FeedPostApi feedPostApi;

  FeedPostRepository(this.feedPostApi);

  Future<List<FeedPostModel>> getUsersRequested() async {
    final response = await feedPostApi.getPostsApi();
    final posts = (response.data['data'] as List)
        .map((e) => FeedPostModel.fromJson(e))
        .toList();
    return posts;
  }
}
