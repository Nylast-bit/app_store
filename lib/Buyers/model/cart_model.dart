class CartModel {
  final String productName;
  final double productPrice;
  final String productCategory;
  final List imageUrl;
  late int quantity; //Cantidad que pide el cliente de un producto
  final int inStock;
  final String productId;
  final String productSize;
  final double productDiscount;
  final String productDescription;

  CartModel(
        {required this.productName,
        required this.productPrice,
        required this.productCategory,
        required this.imageUrl,
        required this.inStock,
        required this.quantity,
        required this.productId,
        required this.productSize,
        required this.productDiscount,
        required this.productDescription
        }
      );
}
