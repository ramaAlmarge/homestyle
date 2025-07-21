import 'package:flutter/material.dart';

import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/model/proudctmodel.dart';
import 'package:homestyle/model/review_model.dart';
import 'package:homestyle/widget/componentbutton.dart';
import 'package:homestyle/widget/review_item.dart';

class ReviewPage extends StatelessWidget {
  final ProductModel product;

  const ReviewPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // ✅ Fake Data باستخدام ReviewModel
    final List<ReviewModel> reviews = [
      ReviewModel(
        username: 'John Doe',
        avatarUrl: 'assets/images/avatar1.jpg',
        rating: 4.5,
        comment: 'Amazing quality and finish!',
        date: '15 July 2025',
      ),
      ReviewModel(
        username: 'Fatima Ali',
        avatarUrl: 'assets/images/avatar1.jpg',
        rating: 4.0,
        comment: 'Looks great, but late delivery.',
        date: '13 July 2025',
      ),
      ReviewModel(
        username: 'Ahmad K.',
        avatarUrl: 'assets/images/avatar1.jpg',
        rating: 5.0,
        comment: 'Perfect size and great color!',
        date: '10 July 2025',
      ),
    ];

    // ✅ حساب المعدل وعدد التقييمات (تجهيزيًا)
    final double averageRating = reviews.isNotEmpty
        ? reviews.map((r) => r.rating).reduce((a, b) => a + b) / reviews.length
        : 0.0;

    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      appBar: AppBar(
        title: const Text(
          'Rating & Review',
          style: TextStyle(
              color: Colormanager.primarycolor,
              fontWeight: FontWeight.w600,
              fontSize: 16.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ✅ صندوق تقييم المنتج بالأعلى
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Image.asset(product.image, width: 72, height: 72),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              averageRating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '(${reviews.length} reviews)',
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            // ✅ عرض التعليقات
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ReviewItem(review: reviews[index]);
                },
              ),
            ),
            SafeArea(
              minimum: const EdgeInsets.only(bottom: 16), // مسافة إضافية تحت البوتون
              child: CustomButton(
                title: "write a riview",
                backgroundColor: Colormanager.primarycolor,
                onPressed: () {
                  Navigator.pushNamed(context, '/review');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
