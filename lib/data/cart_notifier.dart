import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/sneaker.dart';

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>(
  (ref) => CartNotifier(),
);

class CartNotifier extends ChangeNotifier {
  List<Sneaker> _sneakersInCart = [];

  List<Sneaker> get sneakersInCart => _sneakersInCart;

  void addToCart(Sneaker sneaker) {
    _sneakersInCart.add(sneaker);
    notifyListeners();
  }

  void removeFromCart(Sneaker sneaker) {
    _sneakersInCart.remove(sneaker);
    notifyListeners();
  }

  void clearCart() {
    _sneakersInCart.clear();
    notifyListeners();
  }

  double getTotalAmountInDollars() {
    double totalAmount = 0.0;
    for (var sneaker in _sneakersInCart) {
      totalAmount += sneaker.price;
    }
    return totalAmount;
  }
}
