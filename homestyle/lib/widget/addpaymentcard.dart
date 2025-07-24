import 'package:flutter/material.dart';

class CustomCreditCardView extends StatelessWidget {
  const CustomCreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/icons/mastercard.png', width: 60),
          const SizedBox(height: 24),
          const Text(
            '**** **** **** XXXX',
            style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Card Holder Name', style: TextStyle(color: Colors.white70)),
              Text('Expiry Date', style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('XXXXX', style: TextStyle(color: Colors.white)),
              Text('XX/XX', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
