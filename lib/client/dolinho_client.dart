import 'dart:convert';

import 'package:serotonina/models/post.dart';
import 'package:http/http.dart' as http;

class DolinhoClient {
  Future<List<Post>> fetchPosts() async {
    await Future.delayed(Duration(seconds: 5));
    final url = Uri.parse('http://192.168.3.160:8000/post');
    final response = await http.get(url);
    final wirePosts = JsonDecoder().convert(response.body);
    return wirePosts.map<Post>((json) => Post.fromJson(json)).toList();
  }
}
