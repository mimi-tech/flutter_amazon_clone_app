import 'package:amazon_clone1/Models/cart_item.dart';

class OrderModel {
  final String orderId;
  final dynamic amount;
  final List<CartItem> products;
  final String dateTime;

  OrderModel(
      {
        required this.orderId,
        required this.amount,
        required this.products,
        required this.dateTime});
}