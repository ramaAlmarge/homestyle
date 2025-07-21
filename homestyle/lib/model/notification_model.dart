class NotificationModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String date;
  final bool isNew;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.date,
    this.isNew = false,
  });
}
