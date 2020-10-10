import 'package:flutter/foundation.dart';

class CartItem {
  final String id, title;
  final int quantity;
  final double price;

  CartItem({this.id, this.title, this.quantity, this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  // for getters we dont add ()
  int get itemCount {
    return _items.length;
  }

  //
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // change quantity
      _items.update(
        productId,
        (existingvalue) => CartItem(
          id: existingvalue.id,
          title: existingvalue.title,
          quantity: existingvalue.quantity + 1,
          price: existingvalue.price,
        ),
      );
    } else {
      // putifabsent simply createsa a value on that key if the value is absent, in this case the value is created with the cartitem
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
