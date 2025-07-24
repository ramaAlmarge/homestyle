// pages/add_payment_page.dart

import 'package:flutter/material.dart';
import 'package:homestyle/core/resources/color_manager.dart';

import 'package:homestyle/widget/add_payment_controller.dart';
import 'package:homestyle/widget/customtextfield .dart';

class Addpaymentpage extends StatefulWidget {
  const Addpaymentpage({super.key});

  @override
  State<Addpaymentpage> createState() => _AddpaymentpageState();
}

class _AddpaymentpageState extends State<Addpaymentpage> {
  final AddPaymentController controller = AddPaymentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add payment method'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              _buildCardPreview(),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'CardHolder Name',
                hintText: 'Ex: Bruno Pham',
                onChanged: (val) => controller.cardHolder = val,
                validator: (val) => val == null || val.isEmpty ? 'Enter cardholder name' : null,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                label: 'Card Number',
                hintText: '**** **** **** 3456',
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.cardNumber = val,
                validator: (val) => val == null || val.length < 16 ? 'Enter valid card number' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      label: 'CVV',
                      hintText: 'Ex: 123',
                      keyboardType: TextInputType.number,
                      onChanged: (val) => controller.cvv = val,
                      validator: (val) => val == null || val.length != 3 ? 'CVV must be 3 digits' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextFormField(
                      label: 'Expiration Date',
                      hintText: 'MM/YY',
                      keyboardType: TextInputType.datetime,
                      onChanged: (val) => controller.expiryDate = val,
                      validator: (val) => val == null || !RegExp(r'^\d{2}/\d{2}$').hasMatch(val) ? 'Format MM/YY' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (controller.validateAndSave()) {
                    final newCard = controller.getCardData();
                    // TODO: استخدمي newCard حسب الحاجة
                    Navigator.pop(context); // رجوع بعد الإضافة
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colormanager.primarycolor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add new card',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardPreview() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/mastercard.png',
            width: 60,
          ),
          const SizedBox(height: 16),
          const Text(
            '•••• •••• •••• XXXX',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Card Holder Name',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                'Expiry',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'XXXXXX',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'XX/XX',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
