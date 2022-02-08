class Post {
  Post({required this.title});

  final String title;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
    );
  }
}
