import 'package:flutter/material.dart';
import 'package:homestyle/core/resources/asset_manager.dart';
import 'package:homestyle/widget/component_list.dart';
import 'package:homestyle/widget/component_proudctgrid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ), 
        backgroundColor: Colors.transparent,
        title: Center(child: Image.asset(Assetmanager.imageappbar)),
        actions: [
        
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CategoryList(),
          Expanded(child: ProductGrid()),
        ],
      ),
    );
  }
}
