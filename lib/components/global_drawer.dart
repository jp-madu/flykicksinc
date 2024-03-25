import 'package:flutter/material.dart';

class GlobalDrawer extends StatelessWidget {
  void Function()? navigateToStore;
  void Function()? navigateToCart;
  GlobalDrawer({
    super.key,
    required this.navigateToCart,
    required this.navigateToStore,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const SizedBox(
          //   height: 200,
          // ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: navigateToStore,
              ),

              // padding: const EdgeInsets.symmetric(vertical: 12.0),
              ListTile(
                leading: Icon(Icons.shopping_bag_sharp),
                title: Text('Cart'),
                onTap: navigateToCart,
              ),
            ],
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app_sharp),
              title: Text('Exit'),
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
