import 'package:flutter/material.dart';

class ProductTextWidget extends StatelessWidget {
  const ProductTextWidget({super.key, required this.text,

  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
          ),
        ],
      ),
    );
  }
}
