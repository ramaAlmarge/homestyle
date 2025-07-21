import 'package:flutter/material.dart';
import 'package:homestyle/core/resources/asset_manager.dart';
import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/model/notification_model.dart';
import 'package:homestyle/views/favoritepage.dart';
import 'package:homestyle/widget/notification_list.dart';
// تأكد أنك مستدعي هاي

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int selectedIndex = 2; // لأن هاي صفحة الإشعارات

  final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Your order #123456789 has been shipped successfully',
      subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
      date: '19:20',
      isNew: true,
    ),
    NotificationModel(
      title: 'Your order #123456789 has been confirmed',
      subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      imageUrl: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
      date: '18:50',
      isNew: false,
    ),
    // أضف المزيد حسب الحاجة
  ];

  void navigateToPage(int index) {
    if (index == selectedIndex) return; // ما تعمل شي إذا أنت بالفعل بنفس الصفحة

    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/favorites');
        break;
      case 2:
        // أنت بالفعل بصفحة الإشعارات
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
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: NotificationList(notifications: notifications),
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
            label: 'Notifications',
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
