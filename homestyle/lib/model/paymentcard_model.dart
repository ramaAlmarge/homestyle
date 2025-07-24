class PaymentCardModel {
  final String cardType;
  final String lastDigits;
  final String expiryDate;
  final String cardHolderName;
  final bool isDefault;

  const PaymentCardModel({
     required this.cardType,
    required this.lastDigits,
    required this.expiryDate,
    required this.cardHolderName,
    this.isDefault = false,
  });
}
