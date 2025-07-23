import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String name;
  final String address;
  final bool isSelected;
  final VoidCallback onChanged;

  const AddressCard({
    super.key,
    required this.name,
    required this.address,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Checkbox(
          value: isSelected,
          onChanged: (_) => onChanged(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(address),
      ),
    );
  }
}
