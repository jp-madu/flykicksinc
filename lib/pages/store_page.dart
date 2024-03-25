import 'package:flutter/material.dart';
import 'package:flykicksinc/model/sneaker.dart';

import '../components/sneaker_tile.dart';

class StorePage extends StatefulWidget {
  const StorePage({
    super.key,
  });

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        //welcome note.
        Center(
          child: Text(
            'Welcome fam. Cope the fliest kicks here!!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),

        //list of available sneakers in store
        SizedBox(
          height: 550,
          child: Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: sneakersList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final shoe = sneakersList[index];
                  return SneakerTile(
                    sneaker: shoe,
                  );
                }),
          ),
        ),
      ],
    );

    // Expanded(
    //   child: ListView.builder(
    //       itemCount: sneakersList.length,
    //       itemBuilder: (context, index) {
    //         final shoe = sneakersList[index];
    //         return ListTile(
    //           title: Text(shoe.name),
    //           subtitle: Text('\$${shoe.price}'),
    //           trailing: IconButton(
    //             onPressed: () {},
    //             icon: Icon(Icons.add_shopping_cart_outlined),
    //           ),
    //         );
    //       }),
    // );
  }
}
