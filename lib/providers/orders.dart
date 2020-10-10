import 'package:Shop_App/providers/cart.dart';
import 'package:flutter/foundation.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartproducts, double total) {
    // we could use add, but add always insert at the  end of the list, while with insert 0, we add
    // in the beginning of the list.
    _orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartproducts),
    );
    notifyListeners();
  }
}
