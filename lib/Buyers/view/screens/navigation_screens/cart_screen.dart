import 'dart:js_interop_unsafe';

import 'package:appmovil/providers/card_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final _cartData = ref.watch(cartProvider);
    final _cartReader = ref.read(cartProvider.notifier);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 118,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/cartb.png'),
                    fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 322,
                  top: 52,
                  child: Image.asset('assets/icons/not.png', width: 26, height: 25,)
              ),
            ],
          ),
      ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: _cartData.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              final cartItem = _cartData.values.toList()[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(cartItem.imageUrl[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  cartItem.productName,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                cartItem.productCategory,
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                cartItem.productPrice.toStringAsFixed(2),
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  color: Color(0xff102de1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Color(0xff102de1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(onPressed: () {
                                          _cartReader.decrementItem(cartItem.productId);
                                        }, icon: Icon(CupertinoIcons.minus), color: Colors.white
                                        ),
                                        Text(cartItem.quantity.toString(),
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,

                                          ),
                                        ),
                                        IconButton(onPressed: () {
                                          _cartReader.incrementItem(cartItem.productId);

                                        }, icon: Icon(CupertinoIcons.plus), color: Colors.white
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(onPressed: () {
                                    _cartReader.removeItem(cartItem.productId);
                                  }, icon: Icon(Icons.delete_sharp), color: Colors.red,)
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              );
            },
        ),
      )
    );
  }
}
