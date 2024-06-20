import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, this.productData});

  final productData;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final Stream<QuerySnapshot> _bannersStream =
      FirebaseFirestore.instance.collection('productImages').snapshots();

  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Text(
              widget.productData['productName'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
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
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: PageView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // Suponiendo que 'images' es una lista de URLs
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'USD ' + widget.productData['productoPrice'].toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 20),
                Wrap(
                  spacing: 8.0,
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
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Category: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  widget.productData['productCategory'].toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 20),

                SizedBox(
                  width: 20,
                ),
                Text(
                  'Stock: ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  widget.productData['productQuantity'].toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                children: [
                  Text(
                    widget.productData['productDescription'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                    ),

                  ),
                ],
              ),
            ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(

                  onPressed: () {

                  },
                  style: ButtonStyle(

                  ),
                  child: Text('Add to Cart'),

                ),
              ),

          ]),
        ),
      ),
    );
  }
}
