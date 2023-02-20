import 'dart:core';
import 'package:amazon_clone_new/Models/cart_item.dart';
import 'package:amazon_clone_new/Models/product_modal.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static var items = <CartItem>[].obs;
  var total = 0.0;
  var cartCount = 0.obs;
  var totalPrice = 0.0.obs;
  increment() => cartCount++;
  decrement() => cartCount--;

   totalAmount(productPrice,productQuantity){
     total = productPrice * productQuantity;
     var newTotal = totalPrice + total;
     totalPrice(newTotal.toDouble());

  }

  removeTotalAmount(){

    for (var element in items) {
      total = element.productPrice * element.productQuantity;
    }

    var newTotal = totalPrice - total;
    totalPrice(newTotal.toDouble());
    //return total;
  }

  void addItem({
    required productId,
    required productPrice,
    required productName,
    required productQuantity,
    required productImageUrl,
    required productSize,
    required productBrand,

  }) {
    totalAmount(productPrice,productQuantity);

    //return total;



      items.add(CartItem(
        productId: DateTime.now().toString(),
        productName: productName,
        productPrice: productPrice,
        productQuantity: 1,
          productImageUrl:productImageUrl,
          productSize:productSize,
          productBrand:productBrand
      ));

      update();

    }



  void removeItem(String productId) {


    //items.removeWhere((key, value) => key.productId);
    removeTotalAmount();
    items.removeWhere((element) => element.productId == productId);
    update();
  }
  void minusStockCount(ProductModal product) {
    product.productStock = product.productStock! - 1;
    update();
  }

  void addItemToCart(ProductModal product){
    if(product.productStock! > 0){
      increment();
    minusStockCount(product);
      addItem(
          productId: product.productId,
          productPrice: product.productPrice??1000.toDouble(),
          productName: product.productName,
          productImageUrl: product.productImageUrl,
          productQuantity: 1,
          productSize: product.productSize,
          productBrand:product.productType

      );
      Get.snackbar(
        "Orders",
        "Product added successfully",
        backgroundColor: kNavyColor,
        colorText: kWhiteColor,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInOut,
        dismissDirection: DismissDirection.up,

      );
    }else{
      Get.snackbar(
        "Orders",
        "Product is out of stock",
        backgroundColor: kNavyColor,
        colorText: kRedColor,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInOut,
        dismissDirection: DismissDirection.up,

      );
    }
  }

  void increaseQuantity(CartItem cartItem) {
    cartItem.productQuantity = cartItem.productQuantity + 1;
    totalPrice(totalPrice.toDouble() + cartItem.productPrice.toDouble());
    update();
  }

  void decreaseQuantity(CartItem cartItem) {
     if(cartItem.productQuantity > 1){
    cartItem.productQuantity = cartItem.productQuantity - 1;
    totalPrice(totalPrice.toDouble() - cartItem.productPrice.toDouble());
    update();
  }}

  void clear() {
    items.clear();
    cartCount(0);
    update();
  }
}


