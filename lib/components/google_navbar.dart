import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  GoogleNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        color: Color(0xff474448),
        activeColor: Color(0xff2d232e),
        tabBackgroundColor: Color(0xffe0ddcf),
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(
          color: Color(0xfff1f0ea),
        ),
        onTabChange: (value) => onTabChange!(value),
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
      ),
    );
  }
}
