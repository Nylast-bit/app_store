import 'package:appmovil/Buyers/model/cart_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Exponer la clase
final cartProvider = StateNotifierProvider<CartNotifier, Map<String, CartModel>>((ref){
  return CartNotifier();
});
class CartNotifier extends StateNotifier<Map<String, CartModel>> {
  CartNotifier() : super({});

  //Metodo para aniadir un producto al cart
  void addProductToCart({
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

  //Incrementar la cantidad de un producto
  void incrementItem(String productId){
    if(state.containsKey(productId)){
      state[productId]!.quantity++;
    }
    state = {
      ...state
    };

  }

  //Decrementer la cantidad de un producto
  void decrementItem(String productId){
    if(state.containsKey(productId)){
      state[productId]!.quantity--;
    }
    state = {
      ...state
    };
  }

  //Eliminar un producto
  void removeItem(String productId){
    state.remove(productId);
    state ={...state};
  }


  //Metodo para calcular el subtotal
  double calculateTotals(){
    double totalAmount = 0.0;
    state.forEach((productId, cartItem) {
      totalAmount += (cartItem.quantity * cartItem.productPrice - cartItem.productDiscount);
    });
    return totalAmount;
  }
}
