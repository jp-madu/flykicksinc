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
  bool isCartpageActive = true;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//navigate to cart from the appbar
  void navigateToCartPage() {
    setState(() {
      _selectedIndex = 1; // Set index to CartPage
    });
  }

//navigate to cart from the drawer
  void navigateToCart() {
    Navigator.pop(context);
    setState(() {
      _selectedIndex = 1; // Set index to CartPage
    });
  }

//navigate to store from the drawer
  void navigateToStore() {
    Navigator.pop(context);
    setState(() {
      _selectedIndex = 0; // Set index to StorePage
    });
  }

  final List<Widget> _pages = [
    //store page
    StorePage(),

    //cart page
    CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> appBarTitles = ["Store Page", "Cart Page"];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: GoogleNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        title: Center(
          child: Text(appBarTitles[_selectedIndex]),
        ),
        actions: [
          ShoppingCartIconWithOverlay(
            onPressed: navigateToCartPage,
          ),
        ],
      ),
      drawer: GlobalDrawer(
        navigateToCart: navigateToCart,
        navigateToStore: navigateToStore,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
