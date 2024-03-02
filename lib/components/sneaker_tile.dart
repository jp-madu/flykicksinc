import 'package:flutter/material.dart';
import 'package:flykicksinc/model/sneaker.dart';

class SneakerTile extends StatelessWidget {
  final Sneaker sneaker;
  SneakerTile({super.key, required this.sneaker});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          //display sneaker image
          Icon(Icons.favorite),

          //display sneaker name
          Text(sneaker.name),

          //display produt description
          Text(sneaker.description),

          //display price + add to cart icon button
          Text('\$${sneaker.price}'),
        ],
      ),
    );
  }
}
