import 'package:flutter/material.dart';
import 'package:homestyle/core/routes/routeclass.dart';
import 'package:homestyle/views/onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812), // أبعاد التصميم من Figma
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,

    // home: Onboarding(), 
    
    );
  }
}
