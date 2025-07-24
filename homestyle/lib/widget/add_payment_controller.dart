// controllers/add_payment_controller.dart

import 'package:flutter/material.dart';
import 'package:homestyle/model/new_payment_method_model.dart';






class AddPaymentController {
  final formKey = GlobalKey<FormState>();

  String cardHolder = '';
  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';

  bool validateAndSave() {
    return formKey.currentState?.validate() ?? false;
  }

  NewPaymentMethodModel getCardData() {
    return NewPaymentMethodModel(
      cardHolder: cardHolder,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvv: cvv,
    );
  }
}
