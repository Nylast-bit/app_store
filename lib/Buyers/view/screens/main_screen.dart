import 'package:appmovil/Buyers/view/screens/navigation_screens/product_screen.dart';
import 'package:flutter/material.dart';

import 'navigation_screens/account_screen.dart';
import 'navigation_screens/cart_screen.dart';
import 'navigation_screens/favorites_screen.dart';
import 'navigation_screens/home_screen.dart';
import 'navigation_screens/store_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;

  List<Widget> _pageList = [
    HomeScreen(),
    FavoriteScreen(),
    StoreScreen(),
    CartScreen(),

    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffce0611),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_outlined,
              size: 30,
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: _pageList[_currentPage],
    );
  }
}
