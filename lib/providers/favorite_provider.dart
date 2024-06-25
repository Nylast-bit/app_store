import 'package:appmovil/Buyers/model/cart_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:js_interop_unsafe';

import 'package:appmovil/providers/card_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

//import '../inner_screens/check_out_screen.dart';

//Exponer la clase
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, Map<String, CartModel>>((ref){
  return FavoriteNotifier();
});
class FavoriteNotifier extends StateNotifier<Map<String, CartModel>> {
  FavoriteNotifier() : super({});

  //Metodo para aniadir un producto al cart
  void addProductToFavorites({
    required String productName,
    required double productPrice,
    required String productCategory,
    required List imageUrl,
    required int quantity, //Cantidad que pide el cliente de un producto
    required int inStock,
    required String productId,
    required String productSize,
    required double productDiscount,
    required String productDescription,
  }) {
    if(state.containsKey(productId)){
      //Actualizar el producto
      state = {
        ...state,
        productId: CartModel(
            productName: state[productName]!.productName,
            productPrice: state[productPrice]!.productPrice,
            productCategory: state[productCategory]!.productCategory,
            imageUrl: state[imageUrl]!.imageUrl,
            quantity: state[quantity]!.quantity + 1,
            inStock: state[inStock]!.inStock,
            productId: state[productId]!.productId,
            productSize: state[productSize]!.productSize,
            productDiscount: state[productDiscount]!.productDiscount,
            productDescription: state[productDescription]!.productDescription

        )
      };
    }
    else {
      state = {
        ...state,
        productId:CartModel(
            productName: productName,
            productPrice: productPrice,
            productCategory: productCategory,
            imageUrl: imageUrl,
            quantity: quantity,
            inStock: inStock,
            productId: productId,
            productSize: productSize,
            productDiscount: productDiscount,
            productDescription: productDescription

        )
      };
    }
  }

  //Getter
  Map<String, CartModel> get getCartItem => state;

  void removeItem(String productId){
    state.remove(productId);
    state ={...state};
  }

}
