import 'package:flutter/material.dart';
import 'package:homestyle/views/cart_page.dart';
import 'package:homestyle/views/check_outpage.dart';
import 'package:homestyle/views/favoritepage.dart';
import 'package:homestyle/views/homepage.dart';
import 'package:homestyle/views/login_page.dart';
import 'package:homestyle/views/onboarding.dart';
import 'package:homestyle/views/profile_page.dart';
import 'package:homestyle/views/signup.dart';
import 'package:homestyle/views/notification_page.dart'; // ✅ إذا عندك صفحة إشعارات

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const Onboarding(),
    '/login': (context) => const login(),
    '/signup': (context) => const Signup(),
    '/home': (context) => const HomePage(),
    '/favorites': (context) => const FavoritesPage(),
    '/profile': (context) => const ProfilePage(),
    '/cart': (context) => const CartPage(),
'/checkout': (context) => const CheckOut1(),
    '/notifications': (context) => const NotificationPage(), // ✅
  };
}
