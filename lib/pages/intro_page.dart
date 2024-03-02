import 'package:flutter/material.dart';

import 'package:flykicksinc/components/google_navbar.dart';
import 'package:flykicksinc/pages/cart_page.dart';
import 'package:flykicksinc/pages/store_page.dart';

import '../components/global_drawer.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    CartPage(),
    StorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: GoogleNavbar(),
      appBar: AppBar(
        title: Text('Store'),
        elevation: 0,
        actions: [Icon(Icons.shopping_cart_checkout)],
      ),
      drawer: GlobalDrawer(),
    );
  }
}
