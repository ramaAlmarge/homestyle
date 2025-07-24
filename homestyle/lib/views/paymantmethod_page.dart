import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:homestyle/model/paymentcard_model.dart';
import 'package:homestyle/widget/credit_cardwidget.dart';

class PaymantMethod extends StatelessWidget {
  const PaymantMethod({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ تعريف القائمة داخل الـ build() لتكون غير null
    final List<PaymentCardModel> cards = [
      const PaymentCardModel(
        cardType: 'Mastercard',
        lastDigits: '3947',
        expiryDate: '05/23',
        cardHolderName: 'Jennyrfer Doe',
        isDefault: true,
      ),
      const PaymentCardModel(
        cardType: 'Visa',
        lastDigits: '3947',
        expiryDate: '05/23',
        cardHolderName: 'Jennyrfer Doe',
        isDefault: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment method'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ✅ استخدام map على القائمة بعد ما تأكدنا إنها مو null
            ...cards.map(
              (card) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CreditCardWidget(
                  cardType: card.cardType,
                  lastDigits: card.lastDigits,
                  expiryDate: card.expiryDate,
                  cardHolderName: card.cardHolderName,
                  isDefault: card.isDefault,
                ),
              ),
            ),
            const Spacer(),
            // const AddCardButton(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Addpaymentpage');
                },
                backgroundColor: Colors.grey.shade200,
                elevation: 2,
                child: const Icon(Icons.add, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
