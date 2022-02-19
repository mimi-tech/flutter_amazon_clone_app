class ProductModal {
  String? productId;
  String? productName;
  String? productType;
  String? productImageUrl;
  String? productSize;
  dynamic productRate;
  int? productLike;
  String? productOwnerId;
  String? productOwnerFirstName;
  String? productOwnerLastName;
  int? productStock;
  dynamic productPrice;
  String? dateAdded;
  bool isFavourite = false;



  ProductModal({
    this.productId,
    this.productName,
    this.productType,
    this.productImageUrl,
    this.productSize,
    this.productRate,
    this.productLike,
    this.productOwnerId,
    this.productOwnerFirstName,
    this.productOwnerLastName,
    this.productStock,
    this.productPrice,
    this.dateAdded,
    this.isFavourite =false



  });

  // now create converter

  ProductModal.fromJson(Map<String,dynamic> responseData){
      productId = responseData['productId'];
      productName = responseData['productName'];
      productType = responseData['productType'];
      productImageUrl = responseData['productImageUrl'];
      productSize = responseData['productSize'];
      productRate = responseData['productRate']== null ? null : responseData["productRate"].toDouble();
      productLike = responseData['productLike'];
      productOwnerId = responseData['productOwnerId'];
      productOwnerFirstName = responseData['productOwnerFirstName'];
      productOwnerLastName = responseData['productOwnerLastName'];
      productStock = responseData['productStock'];
      productPrice = responseData['productPrice']== null ? null : responseData["productPrice"].toDouble();
      dateAdded = responseData['dateAdded'];
     isFavourite = false;
  }

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "productName": productName,
      "productType": productType,
      "productImageUrl": productImageUrl,
      "productSize": productSize,
      "productRate": productRate,
      "productLike": productLike,
      "productOwnerId": productOwnerId,
      "productOwnerFirstName": productOwnerFirstName,
      "productOwnerLastName": productOwnerLastName,
      "productStock": productStock,
      "productPrice": productPrice,
      "dateAdded": dateAdded,
     "isFavourite": false,

    };
  }
}
