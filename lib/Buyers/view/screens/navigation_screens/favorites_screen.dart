import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:appmovil/providers/favorite_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:js_interop_unsafe';

import 'package:appmovil/providers/card_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

import '../inner_screens/check_out_screen.dart';




class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
 _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override

  Widget build(BuildContext context) {
    final _favoriteData = ref.watch(favoriteProvider);
    final _favoriteReader = ref.read(favoriteProvider.notifier);
    final countItem = _favoriteData.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 118,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/favoriteb.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Stack(
            children: [
              Positioned(
                left: 322,
                top: 52,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/icons/not.png',
                      width: 26,
                      height: 25,
                    ),
                    Positioned(
                      top: -1,
                      right: 3,
                      child: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.yellow.shade800,
                        ),
                        badgeContent: Text(
                          countItem.toString(), //poner numero de items en el carrito
                          style: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 61,
                top: 51,
                child: Text(
                  'My favorite',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),

        body: SingleChildScrollView(

          child: Column(
            children: [ Container(
              width: MediaQuery.of(context).size.width,
              height: 49,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 49,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(color: Color(0xffd7ddff)),
                    ),
                  ),
                  Positioned(
                    left: 44,
                    top: 19,
                    child: Container(
                      width: 10,
                      height: 10,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Positioned(
                    left: 69,
                    top: 14,
                    child: Text(
                      'You have' + countItem.toString() + 'item(s)',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.7),
                    ),
                  )
                ],
              ),
            ),
              ListView.builder(
                itemCount: _favoriteData.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  final favoriteItem = _favoriteData.values.toList()[index];
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
                              child: Image.network(favoriteItem.imageUrl[0],
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
                                    favoriteItem.productName,
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    favoriteItem.productCategory,
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    favoriteItem.productPrice.toStringAsFixed(2),
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

                                            Text(favoriteItem.quantity.toString(),
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,

                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(onPressed: () {
                                        _favoriteReader.removeItem(favoriteItem.productId);
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
            ],
          ),
        ),

    );
  }
}
