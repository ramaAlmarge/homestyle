import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardType;
  final String lastDigits;
  final String expiryDate;
  final String cardHolderName;
  final bool isDefault;

  const CreditCardWidget({
    super.key,
    required this.cardType,
    required this.lastDigits,
    required this.expiryDate,
    required this.cardHolderName,
    required this.isDefault,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = cardType == 'Mastercard';
    final textColor = isDark ? Colors.white : Colors.black;

    return Card(
      elevation: 4,
      color: isDark ? Colors.black : Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '**** **** **** $lastDigits',
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Card Holder Name: $cardHolderName',
              style: TextStyle(color: textColor),
            ),
            Text(
              'Expiry Date: $expiryDate',
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: isDefault,
                  onChanged: (_) {},
                  activeColor: Colors.orange,
                ),
                Text(
                  'Use as default payment method',
                  style: TextStyle(
                    color: isDefault ? Colors.orange : textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
