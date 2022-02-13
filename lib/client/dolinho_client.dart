import 'dart:convert';
import 'package:serotonina/models/curatorship_stats.dart';
import 'package:serotonina/models/post.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://192.168.3.160:8000';

class DolinhoClient {
  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('$_baseUrl/post');
    final response = await http.get(url);
    final wirePosts = JsonDecoder().convert(response.body);
    return wirePosts.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Post>> fetchPostsReadyForCuratorship() async {
    await Future.delayed(Duration(seconds: 2));
    final url = Uri.parse(
      '$_baseUrl/post/ready-for-curatorship',
    );
    final response = await http.get(url);
    final wirePosts = JsonDecoder().convert(response.body);
    return wirePosts.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future curatePost(Post post, bool isApproved) async {
    final url = Uri.parse('$_baseUrl/event');
    return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'postId': post.id,
          'type': 'CURATED_YOUTUBE_VIDEO_UPLOAD',
          'isApproved': isApproved
        },
      ),
    );
  }

  Future<CuratorshipStats> fetchCuratorshipStats() async {
    await Future.delayed(Duration(seconds: 2));
    final url = Uri.parse('$_baseUrl/post/curatorship-stats');
    final response = await http.get(url);
    return CuratorshipStats.fromJson(JsonDecoder().convert(response.body));
  }
}
