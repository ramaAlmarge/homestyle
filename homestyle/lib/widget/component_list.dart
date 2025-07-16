import 'package:flutter/material.dart';


import 'package:homestyle/core/resources/color_manager.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'label': 'Popular', 'icon': Icons.star},
      {'label': 'Chair', 'icon': Icons.chair_alt},
      {'label': 'Table', 'icon': Icons.table_bar_rounded},
      {'label': 'Armchair', 'icon': Icons.chair},
      {'label': 'Bed', 'icon': Icons.bed},
    ];

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 30),
        itemBuilder: (context, index) {
          final isSelected = index == 0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected ? Colormanager.primarycolor : Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  categories[index]['icon'] as IconData,
                  color: isSelected ? Colors.white : Colors.grey[700],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                categories[index]['label'] as String,
                style: TextStyle(
                  color: isSelected ? Colormanager.primarycolor : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
