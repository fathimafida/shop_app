import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/features/home/views/home_view.dart';
import 'package:shop_app/features/orders/order_view.dart';
import 'package:shop_app/features/profile/profile_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bodyItems = [
    HomeView(),
    OrderView(),
    ProfileView(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        index: _selectedIndex,
        backgroundColor: Colors.white,
        color: Colors.deepOrange,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.shopping_bag, color: Colors.white),
          Icon(Icons.person_outline_rounded, color: Colors.white),
        ],
      ),
      body: bodyItems[_selectedIndex],
    );
  }
}
