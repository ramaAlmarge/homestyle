import 'package:flutter/material.dart';

import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/model/proudctmodel.dart';
import 'package:homestyle/widget/componentbutton.dart';
import 'package:homestyle/widget/crat_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductModel> cartItems = [
    ProductModel(name: "Minimal Stand", image: "assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png", price: 25.0),
    ProductModel(name: "Minimal Stand", image: "assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png", price: 25.0),
    ProductModel(name: "Minimal Stand", image: "assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png", price: 25.0),
  ];

  Map<ProductModel, int> itemQuantities = {};

  @override
  void initState() {
    super.initState();
    for (var item in cartItems) {
      itemQuantities[item] = 1;
    }
  }

  void increment(ProductModel item) {
    setState(() {
      itemQuantities[item] = (itemQuantities[item] ?? 1) + 1;
    });
  }

  void decrement(ProductModel item) {
    setState(() {
      if ((itemQuantities[item] ?? 1) > 1) {
        itemQuantities[item] = (itemQuantities[item] ?? 1) - 1;
      }
    });
  }

  void removeItem(ProductModel item) {
    setState(() {
      cartItems.remove(item);
      itemQuantities.remove(item);
    });
  }

  double get total {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.price * (itemQuantities[item] ?? 1);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItem(
                    product: item,
                    quantity: itemQuantities[item] ?? 1,
                    onIncrease: () => increment(item),
                    onDecrease: () => decrement(item),
                    onDelete: () => removeItem(item),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Promo Code
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your promo code",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Total + Checkout
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Total: \$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colormanager.primarycolor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  height: 50,
                  child: CustomButton(
                    title: 'Check out',
                    backgroundColor: Colormanager.primarycolor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
