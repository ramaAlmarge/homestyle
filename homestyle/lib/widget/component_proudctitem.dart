import 'package:flutter/material.dart';
import 'package:homestyle/model/proudctmodel.dart';

import '../../../core/resources/color_manager.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product detail
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(product.image, fit: BoxFit.fill),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colorprimary.primarycolor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  // toggle favorite
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
