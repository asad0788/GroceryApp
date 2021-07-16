import 'package:flutter/cupertino.dart';
import 'package:groccery_stores/provider/Cart.dart';

class OrderItem {
  final String id;
  final double amount;

  final List<CartItem> product;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.dateTime,
    required this.product,
    required this.amount,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    _order.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          dateTime: DateTime.now(),
          product: cartProduct,
          amount: total,
        ));
  }
}
