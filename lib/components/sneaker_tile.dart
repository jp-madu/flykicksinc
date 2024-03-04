import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flykicksinc/data/cart_notifier.dart';
import 'package:flykicksinc/model/sneaker.dart';

class SneakerTile extends ConsumerWidget {
  final Sneaker sneaker;
  SneakerTile({super.key, required this.sneaker});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addSneakerToCart() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Add this pair of sneaker to your cart?'),
          actions: [
            //cancel button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            //proceed to cart button
            MaterialButton(
              onPressed: () {
                //pop dialog box
                Navigator.pop(context);

                //add to cart
                ref.read(cartNotifierProvider.notifier).addToCart(sneaker);
              },
              child: Text('Yes'),
            ),
          ],
        ),
      );
    }

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //display sneaker image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Icon(Icons.favorite),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //display sneaker name
              Text(
                sneaker.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //display produt description
              Text(sneaker.description),
            ],
          ),

          //display price + add to cart icon button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${sneaker.price}'),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addSneakerToCart(),
                  icon: Icon(Icons.add),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
