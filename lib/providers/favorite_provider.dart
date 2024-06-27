
import 'package:appmovil/Buyers/model/favorite_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//Exponer la clase
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, Map<String, FavoriteModel>>((ref){
  return FavoriteNotifier();
});
class FavoriteNotifier extends StateNotifier<Map<String, FavoriteModel>> {
  FavoriteNotifier() : super({});

  //Metodo para aniadir un producto al cart
  void addProductToFavorites({
    required String productName,
    required double productPrice,
    required String productCategory,
    required List imageUrl,
    required int inStock,
    required String productId,

  }) {
    if(state.containsKey(productId)){
      //Actualizar el producto
      state = {
        ...state,
        productId: FavoriteModel(
            productName: state[productName]!.productName,
            productPrice:  state[productPrice]!.productPrice,
            productCategory: state[productCategory]!.productCategory,
            imageUrl: state[imageUrl]!.imageUrl,
            inStock: state[inStock]!.inStock,
            productId: state[productId]!.productId,
        )



      };
    }
    else {
      state = {
        ...state,
        productId:FavoriteModel(
            productName: productName,
            productPrice: productPrice,
            productCategory: productCategory,
            imageUrl: imageUrl,
            inStock: inStock,
            productId: productId,


        )
      };
    }
  }

  //Getter
  Map<String, FavoriteModel> get getFavoriteItem => state;

  void removeItem(String productId){
    state.remove(productId);
    state ={...state};
  }

}
