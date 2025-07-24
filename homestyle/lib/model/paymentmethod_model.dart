class PaymentCardModel {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardType; // مثل visa, mastercard...

  PaymentCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardType,
  });
}
