class OrderModel {
  final String orderNumber;
  final String date;
  final int quantity;
  final double totalAmount;
  final String status; // delivered, processing, canceled

  OrderModel({
    required this.orderNumber,
    required this.date,
    required this.quantity,
    required this.totalAmount,
    required this.status,
  });
}
