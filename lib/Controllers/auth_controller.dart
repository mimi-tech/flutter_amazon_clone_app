import 'dart:convert';

import 'package:amazon_clone_new/Models/product_modal.dart';
import 'package:amazon_clone_new/Models/new_user.dart';
import 'package:amazon_clone_new/Services/api_status.dart';
import 'package:amazon_clone_new/Services/product.dart';
import 'package:amazon_clone_new/Util/constants.dart';
import 'package:amazon_clone_new/Util/sharedPrefrences.dart';
import 'package:amazon_clone_new/screens/tabView.dart';
import 'package:amazon_clone_new/Models/product_modal.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class GeneralController extends GetxController {
  bool isLoading = false;
  bool isRegLoading = false;
  String fullName = "";
  String phoneNumber = "";
  String emailAddress = "";
  String firstName = "";
  String lastName = "";
  String password = "";
  //List<ProductModal> allProducts = [];
  var allProducts = <ProductModal>[].obs;

  String errorText = "Sorry an error occurred";

  void _updateIsLoading(bool currentStatus) {
    isLoading = currentStatus;
    update();
  }


  void _updateIsRegLoading(bool currentStatus) {
    isRegLoading = currentStatus;
    update();
  }

  //registration controller
Future<void> registerUser() async {
    try{
      _updateIsRegLoading(true);

  var uuid = const Uuid();
  var userId = uuid.v4();
    Map<String, dynamic> regJson = {

      "firstName": firstName,
      "lastName": lastName,
      "email":emailAddress,
      "password":password,
      "userId":userId

  };

  //final Map<String, dynamic> jsonValue = json.decode(regJson);
  NewUser authUser = NewUser.fromJson(regJson);
  await UserPreferences().saveUser(authUser);

    //var res = await UserPreferences().getUser();
    UserPreferences().saveAuthId(userId);
      await Future.delayed(const Duration(seconds: 4));
      _updateIsRegLoading(false);
    //push the user to products screen
    Get.offAll(() =>  ProductTabView());
}catch(e){
      _updateIsRegLoading(false);
      notifyFlutterToastError(title: errorText);
    }
  }



}