class Post {
  Post({
    required this.id,
    required this.title,
    required this.assetUrl,
  });

  final String title;
  final String assetUrl;
  final String id;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        title: json['title'],
        assetUrl: "http://192.168.3.160:8020/assets/${json['id']}.mp4");
  }
}
