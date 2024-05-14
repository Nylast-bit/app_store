import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 40,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 40,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 40,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 40,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 40,),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
