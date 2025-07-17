// import 'package:flutter/material.dart';

// class SuccessPage extends StatelessWidget {
//   const SuccessPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/widget/componentbutton.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ✅ Success Icon
            Image.asset('assets/images/Graphics.png'),

            const SizedBox(height: 24),

            // 🎉 Title
            const Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // 📦 Subtitle
            const Text(
              'Your order was placed successfully.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // 🔙 Back to Home Button
            Column(children: [
              CustomButton(
                title: 'Track your orders',
                backgroundColor: Colormanager.primarycolor,
                onPressed: () {
                  Navigator.pushNamed(context, '/success');
                },
              ),
              const SizedBox(
                height: 19,
              ),
              SizedBox(
                height: 50,
                child: CustomButton(
                  title: 'Back to Home',
                  backgroundColor: Colormanager.primarycolor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
