import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavbar extends StatelessWidget {
  const GoogleNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GNav(
      mainAxisAlignment: MainAxisAlignment.center,
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Store',
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: 'Cart',
        ),
      ],
    );
  }
}
