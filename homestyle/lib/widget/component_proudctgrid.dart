import 'package:flutter/material.dart';
import 'package:homestyle/model/proudctmodel.dart';
import 'package:homestyle/widget/component_proudctitem.dart';


class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = [
      ProductModel(
        name: 'Black Simple lamp',
        price: 12.00,
        image: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
      ),
      ProductModel(
        name: 'Minimal Stand',
        price: 25.00,
        image: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
      ),
      ProductModel(
        name: 'Coffee Chair',
        price: 12.00,
        image: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
      ),
      ProductModel(
        name: 'Simple Desk',
        price: 25.00,
        image: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}
