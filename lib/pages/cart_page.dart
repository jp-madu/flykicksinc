import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flykicksinc/data/cart_notifier.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemNotifier = ref.watch(cartNotifierProvider).sneakersInCart;
    //remove sneaker from cart method with dialog box

    return Column(
      children: [
        //show items in cart
        Expanded(
          child: cartItemNotifier.isEmpty
              ? Center(
                  child: Text(
                  'You haven\'t got a sneaker in the cart yet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ))
              : ListView.builder(
                  itemCount: cartItemNotifier.length,
                  itemBuilder: (context, index) {
                    //get individual sneaker in cart
                    final pairOfSneaker = cartItemNotifier[index];

                    void removeSneakerFromCart() {
                      //show a dialog box that asks users to confirm remove sneaker from cart
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text(
                              'Remove this pair of sneakers from your cart?'),
                          actions: [
                            //the cancel button
                            MaterialButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            //proceed to remove sneaker from cart
                            MaterialButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  //pop the dislog box
                                  Navigator.pop(context);
                                  //remove from cart
                                  ref
                                      .read(cartNotifierProvider)
                                      .removeFromCart(pairOfSneaker);
                                }),
                          ],
                        ),
                      );
                    }

                    //return as a cart tile UI
                    return ListTile(
                      title: Text(pairOfSneaker.name),
                      subtitle: Text('\$${pairOfSneaker.price}'),
                      trailing: IconButton(
                        onPressed: () {
                          removeSneakerFromCart();
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
