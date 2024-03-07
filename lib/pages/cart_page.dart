import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flykicksinc/data/cart_notifier.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemNotifier = ref.watch(cartNotifierProvider).sneakersInCart;
    double totalAmount =
        ref.watch(cartNotifierProvider).getTotalAmountInDollars();
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
                      leading: Image.asset(pairOfSneaker.imagePath),
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
        ),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${totalAmount}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xffe83f3a),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))),
                )
              ],
            ))
      ],
    );
  }
}
