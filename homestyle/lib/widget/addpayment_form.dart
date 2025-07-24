import 'package:flutter/material.dart';

class AddPaymentForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;

  const AddPaymentForm({
    super.key,
    required this.nameController,
    required this.numberController,
    required this.expiryController,
    required this.cvvController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'CardHolder Name'),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: numberController,
          decoration: const InputDecoration(labelText: 'Card Number'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: cvvController,
                decoration: const InputDecoration(labelText: 'CVV'),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: expiryController,
                decoration: const InputDecoration(labelText: 'Expiration Date'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
