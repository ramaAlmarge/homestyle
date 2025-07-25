import 'package:flutter/material.dart';
import 'package:homestyle/views/SUCCESS_PAGE.dart';
import 'package:homestyle/views/addpayment_page.dart';
import 'package:homestyle/views/addshippingadress.dart';
import 'package:homestyle/views/cart_page.dart';
import 'package:homestyle/views/check_outpage.dart';
import 'package:homestyle/views/favoritepage.dart';
import 'package:homestyle/views/homepage.dart';
import 'package:homestyle/views/login_page.dart';
import 'package:homestyle/views/myreview_page.dart';
import 'package:homestyle/views/onboarding.dart';
import 'package:homestyle/views/order_page.dart';
import 'package:homestyle/views/paymantmethod_page.dart';
import 'package:homestyle/views/profile_page.dart';
import 'package:homestyle/views/rating_page.dart';
import 'package:homestyle/views/setting_page.dart';
import 'package:homestyle/views/shippingadrress_page.dart';
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
    '/success': (context) => const SuccessPage(),
    '/Orderpage': (context) => const Orderpage(),
    '/ShippingAdreessPage': (context) => ShippingAdreessPage(),
    
    '/PaymantMethod': (context) =>  PaymantMethod(),
    // '/ReviewPage': (context) =>  ReviewPage(),
    '/SettingPage': (context) => const SettingPage(),
    '/AddShippingAddressPage': (context) => AddShippingAddressPage(),
     '/Addpaymentpage': (context) => const Addpaymentpage(),
     '/myReviews': (context) => const MyReviewsPage(),
  };
}
