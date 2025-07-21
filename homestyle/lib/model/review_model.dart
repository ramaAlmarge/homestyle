class ReviewModel {
  final String username;
  final double rating;
  final String comment;
  final String date;
  final String avatarUrl;

  ReviewModel({
    required this.username,
    required this.rating,
    required this.comment,
    required this.date,
    required this.avatarUrl,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      username: json['username'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      comment: json['comment'] ?? '',
      date: json['date'] ?? '',
      avatarUrl: json['avatar'] ?? '',
    );
  }
}
