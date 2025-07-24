import 'package:flutter/material.dart';

import 'package:homestyle/model/myreview_model.dart';

class MyReviewItem extends StatelessWidget {
  final MyReviewModel review;

  const MyReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              review.productImage,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // ✅ التفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم المنتج + التاريخ
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      review.date,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // ⭐ التقييم
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: 18,
                      color: index < review.rating.round() ? Colors.orange : Colors.grey.shade300,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // التعليق
                Text(
                  review.reviewText,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
