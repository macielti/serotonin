class CuratorshipStats {
  CuratorshipStats({required this.approvedTotalDurationSeconds});

  final int approvedTotalDurationSeconds;

  factory CuratorshipStats.fromJson(Map<String, dynamic> json) {
    return CuratorshipStats(
      approvedTotalDurationSeconds: json['totalDurationSeconds'],
    );
  }
}
