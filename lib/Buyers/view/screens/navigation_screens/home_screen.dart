import 'package:flutter/material.dart';

import 'widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}
