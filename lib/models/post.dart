class Post {
  Post({required this.title, required this.assetUrl});

  final String title;
  final String assetUrl;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      assetUrl: "http://192.168.3.160:8020/assets/${json['id']}.mp4"
    );
  }
}
