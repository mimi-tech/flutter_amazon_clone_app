import 'dart:io';

import 'package:amazon_clone1/Models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

const USER_INVALID_RESPONSE = 101;
const NO_INTERNET = 102;
const INVALID_FORMAT = 103;
const UNKNOWN_ERROR = 104;

String? productName;
String? productType;
String? productImageUrl;
String? productSize;
String? productStock;
double? productPrice;
File? imageFile;

String errorText = "Sorry an error occurred";
List<CartItem> userCart= [];
notifyFlutterToastSuccess({required title})async{
  // String title;
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: kBlackColor,
      textColor: Colors.greenAccent);
}

notifyFlutterToastError({required title})async{
  // String title;
  Fluttertoast.showToast(
      timeInSecForIosWeb: 10,
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: kBlackColor,
      textColor: kRedColor);
}
