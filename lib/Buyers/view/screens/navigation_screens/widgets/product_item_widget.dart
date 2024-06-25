import 'package:flutter/material.dart';

import '../product_screen.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key, this.productData});

  final productData;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(
                    productData: widget.productData,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(
            widget.productData['productName'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(child: Image.network(widget.productData['images'][0])),
          SizedBox(
            height: 5,
          ),
          Text(
            'USD ' + widget.productData['productoPrice'].toString(),
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ]),
      ),
    );
  }
}
