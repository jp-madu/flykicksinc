import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flykicksinc/data/cart_notifier.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  //remove sneaker from cart method with dialog box

  void removeSneakerFromCart(BuildContext context) {
    //show a dialog box that asks users to confirm remove sneaker from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Add this pair of sneakers to your cart'),
        actions: [
          //the cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          //the yes button
          MaterialButton(onPressed: () {
            //pop the dislog box
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

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
                      removeSneakerFromCart(context);
                      //add to cart
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
