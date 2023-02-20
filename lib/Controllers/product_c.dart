
import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone_new/Models/product_modal.dart';
import 'package:amazon_clone_new/Services/apiConstants.dart';
import 'package:amazon_clone_new/Services/api_status.dart';
import 'package:amazon_clone_new/Services/product.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/Util/constants.dart';
import 'package:amazon_clone_new/Util/sharedPrefrences.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {

  bool isRegLoading = false;
  var allProducts = <ProductModal>[].obs;
  final productTypeTitle = 'All Products'.obs;
  final firstName = ''.obs;

  void _updateIsRegLoading(bool currentStatus) {
    isRegLoading = currentStatus;
    update();
  }

    updateProductTypeTile(String title) {
    productTypeTitle(title);

  }
  getCurrentUser() async {
   var user = await UserPreferences().getUser();
   firstName(user.firstName);
  }

  @override
  void onInit() {
    getCurrentUser();
    getProducts();
    super.onInit();
  }
  getProducts() async {
    _updateIsRegLoading(true);
    var response = await ApiCaller().fetchProducts();
    if (response.isNotEmpty) {

      allProducts.addAll(response);

      _updateIsRegLoading(false);

    }else{
      _updateIsRegLoading(false);
      notifyFlutterToastError(title:errorText);
    }
  }


  getProductsType({required productType}) async {
    _updateIsRegLoading(true);
    var response = await ApiCaller().fetchProductsTypes(productType: productType);
    if (response.isNotEmpty) {
      allProducts.clear();
      allProducts.addAll(response);

      _updateIsRegLoading(false);

    }else{
      _updateIsRegLoading(false);
      notifyFlutterToastError(title:errorText);
    }
  }

  void toggleFavouriteStatus(ProductModal product) {
    product.isFavourite = !product.isFavourite;
    product.productLike = product.productLike! + 1;
    update();
  }



  Future<void> toggleRateStatus(ProductModal product) async {

    var response = await ApiCaller().updateProductRate(productId: product.productId,rate: product.productRate);
    if (response is Success) {
      product.productRate = product.productRate! * 5 /2;
      update();
    }
    if(response is Failure){
      notifyFlutterToastError(title:response.errorResponse);
    }
  }




  getProductsLike({required productId}) async {

    var response = await ApiCaller().updateProductLikeCount(productId: productId);
    if (response is Success) {
    }
    if(response is Failure){
      notifyFlutterToastError(title:response.errorResponse);
    }
  }


  Future<void> deleteProduct(ProductModal product) async {

    var response = await ApiCaller().deleteProduct(productId: product.productId);
    if (response is Success) {

      allProducts.removeWhere((element) => element.productId == product.productId);
      update();
    }
    if(response is Failure){
      notifyFlutterToastError(title:response.errorResponse);
    }
  }


  Future<void> addProduct() async {
    _updateIsRegLoading(true);

    var response = await ApiCaller().listProduct();
    if (response is Success) {
      _updateIsRegLoading(false);
      notifyFlutterToastSuccess(title:"Product listed successfully");

    }
    if(response is Failure){
      _updateIsRegLoading(false);
      notifyFlutterToastError(title:response.errorResponse);
    }

  }


  getImageFromGallery() async {
    final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final cloudinary = CloudinaryPublic(ApiConstants().cloudinaryName, ApiConstants().cloudinaryPreset, cache: false);


    try {
      _updateIsRegLoading(true);
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          pickedFile!.path,
          resourceType: CloudinaryResourceType.Image,
        ),
      );
      productImageUrl = response.secureUrl;
      _updateIsRegLoading(false);
    } on CloudinaryException catch (e) {
      _updateIsRegLoading(false);
      notifyFlutterToastError(title: "Error uploading your product image");
    }

      imageFile = File(pickedFile!.path);

    // final bytes = File(pickedFile!.path).readAsBytesSync();
    //  imageFile = base64Encode(bytes);

    }
  }

