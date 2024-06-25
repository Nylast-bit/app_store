import 'package:flutter/material.dart';
import 'widgets/banner_widget.dart';
import 'widgets/product_text_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/product_widget.dart';
import 'widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(),
            BannerWidget(),
            CategoriesWidget(),
            ProductTextWidget(
              text: "All Products",
            ),
            ProductWidget(),
          ],
        ),
      ),
    );
  }
}
