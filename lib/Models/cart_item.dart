class CartItem {
  final dynamic productId;
   String productName;
   String productImageUrl;
   int productQuantity;
   double productPrice;
   String productSize;
   String productBrand;
  CartItem({
        required this.productId,
        required this.productName,
        required this.productQuantity,
        required this.productImageUrl,
        required this.productPrice,
        required this.productSize,
        required this.productBrand

  });
}