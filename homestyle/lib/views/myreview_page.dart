import 'package:flutter/material.dart';

import 'package:homestyle/model/myreview_model.dart';

import 'package:homestyle/widget/myreview_item.dart';

class MyReviewsPage extends StatelessWidget {
  const MyReviewsPage({super.key});

  // ✅ بيانات وهمية
  List<MyReviewModel> get reviews => [
        MyReviewModel(
          productName: 'Modern Chair',
          productImage: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
          rating: 4.5,
          reviewText: 'Very comfortable and fits perfectly with my decor!',
          date: '21 July 2025',
        ),
        MyReviewModel(
          productName: 'Wooden Table',
          productImage: 'assets/images/jonny-caspari-wsvCC6UyKjs-unsplash 1.png',
          rating: 5.0,
          reviewText: 'Sturdy and beautiful finish!',
          date: '18 July 2025',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reviews'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            return MyReviewItem(review: reviews[index]);
          },
        ),
      ),
    );
  }
}
