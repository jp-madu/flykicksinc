import 'package:flutter/material.dart';

import 'package:flykicksinc/components/google_navbar.dart';
import 'package:flykicksinc/pages/cart_page.dart';
import 'package:flykicksinc/pages/store_page.dart';

import '../components/global_drawer.dart';
import '../components/shopping_cart.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = [
    //store page
    StorePage(),

    //cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: GoogleNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        title: Text('Store'),
        elevation: 0,
        actions: [
          ShoppingCartIconWithOverlay(),
        ],
      ),
      drawer: GlobalDrawer(),
      body: _pages[_selectedIndex],
    );
  }
}
