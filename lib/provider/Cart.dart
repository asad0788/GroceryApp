import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String tittle;
  final double price;
  final int quaninty;
  final String imagesUrl;
  CartItem(
      {required this.id,
      required this.price,
      required this.tittle,
      required this.quaninty,
      required this.imagesUrl});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};

  Map<String, CartItem> get item {
    return {..._item};
  }

  int get itemCount {
    // ignore: unnecessary_null_comparison
    return _item == null ? 0 : _item.length;
  }

  double get totalAmount {
    var total = 0.0;
    _item.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quaninty;
    });
    return total;
  }

  void addItem(
      String productid, String ptittle, double productPrice, String imageUrl) {
    if (_item.containsKey(productid)) {
      _item.update(
          productid,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                price: existingCartItem.price,
                tittle: existingCartItem.tittle,
                quaninty: existingCartItem.quaninty + 1,
                imagesUrl: existingCartItem.imagesUrl,
              ));
    } else {
      _item.putIfAbsent(
          productid,
          () => CartItem(
              id: DateTime.now().toString(),
              price: productPrice,
              tittle: ptittle,
              quaninty: 1,
              imagesUrl: imageUrl));
    }
    notifyListeners();
  }

  void clear() {
    _item = {};
    notifyListeners();
  }

  void removeItem(String id) {
    _item.remove(id);
    notifyListeners();
  }
}
