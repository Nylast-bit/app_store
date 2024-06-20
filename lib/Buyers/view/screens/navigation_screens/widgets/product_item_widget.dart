import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, this.productData});

  final productData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children:[ Text(productData['productName']),
           Expanded(child: Image.network(productData['productImages'][0])),


          Text('USD ' + productData['productPrice'].ToString())
        ]
      ),
    );
  }
}
