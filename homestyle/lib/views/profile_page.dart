import 'package:flutter/material.dart';

import 'package:homestyle/widget/profile_header.dart';
import 'package:homestyle/widget/profile_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProfileHeader(), // صورة واسم وإيميل
          const Divider(thickness: 1),
          Expanded(
            child: ListView(
              children: [
                ProfileListTile(
                  title: 'My orders',
                  subtitle: 'Already have 10 orders',
                  onTap: () => Navigator.pushNamed(context, '/Orderpage'),
                ),
                ProfileListTile(
                  title: 'Shipping Addresses',
                  subtitle: '03 Addresses',
                  onTap: () => Navigator.pushNamed(context, '/ShippingAdreessPage'),
                ),
                ProfileListTile(
                  title: 'Payment Method',
                  subtitle: 'You have 2 cards',
                  onTap: () => Navigator.pushNamed(context, '/PaymantMethod'),
                ),
                ProfileListTile(
                  title: 'My reviews',
                  subtitle: 'Reviews for 5 items',
                  // ما في تنقل هون حسب التصميم
                ),
                ProfileListTile(
                  title: 'Setting',
                  subtitle: 'Notification, Password, FAQ, Contact',
                  onTap: () => Navigator.pushNamed(context, '/SettingPage'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
