import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onEdit;
  final Widget? leading;

  const InfoSection({
    super.key,
    required this.title,
    required this.value,
    this.onEdit,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.orange),
          onPressed: onEdit,
        ),
      ],
    );
  }
}
