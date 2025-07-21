import 'package:flutter/material.dart';
import '../../../model/notification_model.dart';
import 'notification_item.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotificationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return NotificationItem(item: notifications[index]);
      },
    );
  }
}
