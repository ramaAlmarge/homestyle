import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavIcon extends StatelessWidget {
  final String assetPath;
  final bool isSelected;

  const CustomBottomNavIcon({
    super.key,
    required this.assetPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      color: isSelected ? Colors.orange : Colors.grey,
      width: 24,
      height: 24,
    );
  }
}
