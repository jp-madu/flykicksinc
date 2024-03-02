import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flykicksinc/data/cart_notifier.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemNotifier = ref.watch(cartNotifierProvider).sneakersInCart;
    return Column(
      children: [
        //show items in cart
        Expanded(
          child: ListView.builder(
              itemCount: cartItemNotifier.length,
              itemBuilder: (context, index) {
                //get individual sneaker in cart
                final pairOfSneaker = cartItemNotifier[index];

                //return as a cart tile UI
                return ListTile(
                  title: Text(pairOfSneaker.name),
                  subtitle: Text('\$${pairOfSneaker.price}'),
                  trailing: IconButton(
                    onPressed: () {
                      ref
                          .read(cartNotifierProvider)
                          .removeFromCart(pairOfSneaker);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              }),
        )
      ],
    );
  }
}
