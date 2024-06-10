import 'package:appmovil/Buyers/view/screens/navigation_screens/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/categories_widget.dart';
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
            BannerWidget(),
            CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
