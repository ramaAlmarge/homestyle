// models/new_payment_method_model.dart

class NewPaymentMethodModel {
  final String cardHolder;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  NewPaymentMethodModel({
    required this.cardHolder,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });
}
