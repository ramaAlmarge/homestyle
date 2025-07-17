import 'package:flutter/material.dart';
import 'package:homestyle/core/resources/asset_manager.dart';
import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/widget/info_card.dart';
import 'package:homestyle/widget/info_secssion.dart';

import 'package:homestyle/widget/price_row.dart'; // ✅

class CheckOut1 extends StatelessWidget {
  const CheckOut1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Check out', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InfoCard(
              child: InfoSection(
                title: 'Shipping address',
                value: 'Bruno Fernandes\n25 rue Robert Latouche, Nice, 06200, Côte D’azur, France',
                onEdit: () {
                  // TODO: Handle edit
                },
              ),
            ),
            InfoCard(
              child: InfoSection(
                title: 'Payment',
                value: '•••• •••• •••• 3947',
                onEdit: () {
                  // TODO
                },
              ),
            ),
            InfoCard(
              child: InfoSection(
                title: 'Delivery method',
                value: 'DHL — Fast (2-3days)',
                onEdit: () {},
                leading: Image.asset(
                  Assetmanager.logeDhl,
                  width: 48,
                  height: 24,
                ),
              ),
            ),
            const SizedBox(height: 24),
            InfoCard(
              child: Column(
                children: const [
                  PriceRow(label: 'Order', amount: '\$95.00'),
                  PriceRow(label: 'Delivery', amount: '\$5.00'),
                  Divider(height: 20, thickness: 1),
                  PriceRow(label: 'Total', amount: '\$100.00', isBold: true),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/success');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colormanager.primarycolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit order',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
