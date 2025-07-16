// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:homestyle/core/resources/asset_manager.dart';
// import 'package:homestyle/widget/component_list.dart';
// import 'package:homestyle/widget/component_proudctgrid.dart';
// import 'package:homestyle/widget/custom_navigationbar.dart';

// class HomePage extends StatefulWidget {
// const HomePage({super.key});

// @override
// State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//    void onNavTap(int index) {
//     setState(() {
//       selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/home');
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, '/favorites');
//         break;
//       case 2:
//         Navigator.pushReplacementNamed(context, '/notifications');
//         break;
//       case 3:
//         Navigator.pushReplacementNamed(context, '/profile');
//         break;
//     }
//   }
// int selectedIndex = 0;

// @override
// Widget build(BuildContext context) {
// return Scaffold(
// backgroundColor: Colors.white,


//   appBar: AppBar(
//     elevation: 0,
//     backgroundColor: Colors.transparent,
//     title: Center(
//       child: Image.asset(
//         Assetmanager.imageappbar,
//         height: 40,
//       ),
//     ),
//     leading: IconButton(
//       icon: const Icon(Icons.search),
//       onPressed: () {},
//     ),
//     actions: [
//       IconButton(
//         icon: const Icon(Icons.shopping_cart_outlined),
//         onPressed: () {},
//       ),
//     ],
//   ),

//   body: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: const [
//       CategoryList(),
//       Expanded(child: ProductGrid()),
//     ],
//   ),

//    bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: onNavTap,
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: CustomBottomNavIcon(
//               assetPath: 'assets/icons/clarity_home-solid.svg',
//               isSelected: true,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: CustomBottomNavIcon(
//               assetPath: 'assets/icons/marker 1.svg',
//               isSelected: false,
//             ),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: CustomBottomNavIcon(
//               assetPath: 'assets/icons/bell.svg',
//               isSelected: false,
//             ),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: CustomBottomNavIcon(
//               assetPath: 'assets/icons/bi_person.svg',
//               isSelected: false,
//             ),
//             label: 'Profile',
//           ),
//         ],
//       ),
// );
// }
// }
// import 'package:flutter/material.dart';
// import 'package:furniturestore/core/resources/assets_manager.dart';
// import 'package:furniturestore/widgets/ProductGrid.dart';
// import 'package:furniturestore/widgets/category_list.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Center(child: Image.asset(AssetsManager.Content)),
//         actions: [

//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined),
//             onPressed: () {},
//           ),
//         ],
//         leading: IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           CategoryList(),
//           Expanded(child: ProductGrid()),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:homestyle/core/resources/asset_manager.dart';


import 'package:homestyle/widget/component_list.dart';
import 'package:homestyle/widget/component_proudctgrid.dart';
import 'package:homestyle/widget/custom_navigationbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void onNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    // التنقل بين الصفحات حسب الإندكس
    if (index == 1) {
      Navigator.pushNamed(context, '/favorites');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/notifications');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Image.asset(
            Assetmanager.imageappbar,
            height: 40,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onNavTap,
        // (index) {
        //   setState(() {
        //     selectedIndex = index;
        //   });
        // },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath:Assetmanager.home,
              isSelected: selectedIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: Assetmanager.marker,
              isSelected: selectedIndex == 1,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: Assetmanager.bell,
              isSelected: selectedIndex == 2,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: Assetmanager.pesson,
              isSelected: selectedIndex == 3,
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
