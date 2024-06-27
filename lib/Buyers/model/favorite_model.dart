class FavoriteModel {
  final String productName;
  final double productPrice;
  final String productCategory;
  final List imageUrl;

  final int inStock;
  final String productId;


  FavoriteModel(
      {
        required this.productName,
        required this.productPrice,
        required this.productCategory,
        required this.imageUrl,
        required this.inStock,
        required this.productId,
      }
      );
}
