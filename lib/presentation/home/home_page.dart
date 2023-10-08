import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../cart/cart_history_page.dart';
import '../profile_pages/profile_page.dart';
import 'main_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    const MainProductPage(),
    const Center(child: Text("Cart History Page")),
    const CartHistoryPage(),
    const ProfilePage(),
  ];

  void handleBottomNaveTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: handleBottomNaveTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              tooltip: "Home",
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
              ),
              tooltip: "History",
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              tooltip: "Cart",
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              tooltip: "Me",
              label: ""),
        ],
      ),
    );
  }
}
