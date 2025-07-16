import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homestyle/core/resources/asset_manager.dart';

import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/model/proudctmodel.dart';
import 'package:homestyle/widget/compfavorite_item.dart';
import 'package:homestyle/widget/componentbutton.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<FavoritesPage> {
  int selectedIndex = 1;

  List<ProductModel> favoriteProducts = [
    ProductModel(
      name: "Minimal Stand",
      image: "assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png",
      price: 25.00,
      isFavorite: true,
    ),
    ProductModel(
      name: "Black Chair",
      image: "assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png",
      price: 25.00,
      isFavorite: true,
    ),
    ProductModel(
      name: "Simple Desk",
      image: "assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png",
      price: 25.00,
      isFavorite: true,
    ),
  ];

  void removeFromFavorites(ProductModel product) {
    setState(() {
      favoriteProducts.remove(product);
    });
  }

  void navigateToPage(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // أنت بالفعل بصفحة المفضلة
        break;
      case 2:
        Navigator.pushNamed(context, '/notifications');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return FavoriteItem(
                    product: product,
                    onDelete: () => removeFromFavorites(product),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: double.infinity, // ✅ يعطي عرض مضبوط
                  height: 54,
                  child: CustomButton(
                    title: "add to cart",
                    backgroundColor: Colormanager.primarycolor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: navigateToPage,
        selectedItemColor: Colormanager.primarycolor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: Assetmanager.home,
              isSelected: selectedIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: Assetmanager.marker,
              isSelected: selectedIndex == 1,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: Assetmanager.bell,
              isSelected: selectedIndex == 2,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: Assetmanager.pesson,
              isSelected: selectedIndex == 3,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

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
      color: isSelected ? Colormanager.primarycolor : Colors.grey,
      width: 24,
      height: 24,
    );
  }
}
