import 'package:appmovil/providers/card_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerStatefulWidget {
  ProductScreen({super.key, this.productData});

  final productData;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  final Stream<QuerySnapshot> _bannersStream =
      FirebaseFirestore.instance.collection('productImages').snapshots();

  String? selectedSize;
  bool _isLiked = false; // New variable to track liked state

  @override
  Widget build(BuildContext context) {
    final _cartProvider = ref.read(cartProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked
                  ? Colors.red
                  : Colors.black, // Toggle color based on _isLiked
            ),
            onPressed: () {
              setState(() {
                _isLiked = !_isLiked; // Toggle liked state
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.productData['productName'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: _bannersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: PageView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          List<dynamic> images =
                              snapshot.data!.docs[index]['images'];

                          return PageView.builder(
                            itemCount: images.length,
                            itemBuilder: (context, imageIndex) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: images[imageIndex],
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              Text(
                '\$${widget.productData['productoPrice'].toString()}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0,
                children: List<Widget>.generate(
                  widget.productData['productSize'].length,
                  (int index) {
                    return ChoiceChip(
                      label: Text(widget.productData['productSize'][index]),
                      selected: selectedSize ==
                          widget.productData['productSize'][index],
                      onSelected: (bool selected) {
                        setState(() {
                          selectedSize = selected
                              ? widget.productData['productSize'][index]
                              : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.productData['productCategory'].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Stock: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.productData['productQuantity'].toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.productData['productDescription'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _cartProvider.addProductToCart(
                        productName: widget.productData['productName'],
                        productPrice: double.parse(
                            widget.productData['productoPrice'].toString()),
                        productCategory: widget.productData['productCategory'],
                        imageUrl: widget.productData['images'],
                        quantity: 1,
                        inStock: int.parse(
                            widget.productData['productQuantity'].toString()),
                        productId: widget.productData['productId'].toString(),
                        productSize: "",
                        productDiscount: double.parse(
                            widget.productData['productDiscount'].toString()),
                        productDescription:
                            widget.productData['productDescription']);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          widget.productData['productName'] + " Added to Cart"),
                      margin: EdgeInsets.all(15),
                      backgroundColor: Colors.grey,
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
