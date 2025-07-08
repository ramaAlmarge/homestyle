import 'package:flutter/material.dart';


import 'package:homestyle/views/login_page.dart';
import 'package:homestyle/views/onboarding.dart';
import 'package:homestyle/views/signup.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const Onboarding(),
    '/login': (context) => const login(),
    '/Signup': (context) => const Signup(),
  };
}
