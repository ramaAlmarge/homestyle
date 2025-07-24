class ReviewModel {
  final String username;
  final String avatarUrl;
  final double rating;
  final String comment;
  final String date;

  ReviewModel({
    required this.username,
    required this.avatarUrl,
    required this.rating,
    required this.comment,
    required this.date,
  });
}
