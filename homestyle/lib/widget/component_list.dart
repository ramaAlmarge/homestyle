import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Popular', 'Chair', 'Table', 'Armchair', 'Bed'];
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Chip(
            label: Text(categories[index]),
            backgroundColor: index == 0 ? Colors.black : Colors.grey.shade200,
            labelStyle: TextStyle(
              color: index == 0 ? Colors.white : Colors.black,
            ),
          );
        },
      ),
    );
  }
}
