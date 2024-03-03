import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/cart_notifier.dart';

class ShoppingCartIconWithOverlay extends ConsumerWidget {
  const ShoppingCartIconWithOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartNotifierProvider).sneakersInCart.length;

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.shopping_cart, size: 35.0),
            onPressed: () {}),
        if (cartCount > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.red,
              ),
              child: Text(
                '$cartCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
