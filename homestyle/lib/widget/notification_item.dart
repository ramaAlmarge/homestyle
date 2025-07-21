import 'package:flutter/material.dart';
import '../../../model/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel item;

  const NotificationItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(item.subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              Text(item.date, style: const TextStyle(fontSize: 12)),
              if (item.isNew) const Text("New", style: TextStyle(color: Colors.orange, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
