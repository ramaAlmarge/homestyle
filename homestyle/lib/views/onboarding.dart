import 'package:flutter/material.dart';
import 'package:homestyle/core/resources/asset_manager.dart';
import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/core/resources/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homestyle/widget/componentbutton.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Stack(
children: [

    SizedBox.expand(
            child: Image.asset(
              Assetmanager.onboarding,
              fit: BoxFit.cover,
            ),
          ),
          Align(
alignment: Alignment.bottomCenter,

child: Padding(
  padding: const EdgeInsets.all(30),
  child: Column(children: [
Image.asset(Assetmanager.logo),
SizedBox(height: 12.h,),
Text(Stringtext.onboadingstring,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
SizedBox(height: 336),
                  SizedBox(
                    width: 311.w,
                    height: 54.h,
                    child: CustomButton(
  title: 'Get Started',
  backgroundColor: Colorprimary.primarycolor,
  onPressed: () {
     Navigator.pushNamed(context, '/login');
    // logic
  },
),
                  ),

  ],),
),


          )
],

),


    );
  }
}
