import 'dart:convert';
import 'dart:io';
import 'package:amazon_clone1/Models/product_modal.dart';
import 'package:amazon_clone1/Services/api_status.dart';
import 'package:amazon_clone1/Util/constants.dart';
import 'package:amazon_clone1/Util/sharedPrefrences.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';


class ApiCaller {
  static var client = http.Client();

  Future<List<ProductModal>> fetchProducts() async {
    try{
    var url = "${dotenv.env['VIEW_ALL_PRODUCTS']}";

    final response = await client.get(Uri.parse(url));
     final Map<String, dynamic> jsonDecoded = json.decode(response.body);
       if (jsonDecoded['status'] == true) {

         final List<dynamic> responseData = jsonDecoded['data'];

         final product = responseData.map((json) => ProductModal.fromJson(json)).toList();


         return product;
       }
        throw notifyFlutterToastError(title:errorText);

     }catch(e){
      throw notifyFlutterToastError(title:errorText);
    }
  }

   Future<Object> updateProductLikeCount({required productId})async{

    try{

      var body = json.encode({
        'productId': productId,
      });
      var url = Uri.parse("${dotenv.env['UPDATE_PRODUCT_LIKE']}");
      final response = await client.put(url, headers: {'Content-Type': 'application/json'}, body: body);
      final Map<String,dynamic> jsonDecoded = json.decode(response.body);

      if (jsonDecoded['status'] == true) {

        Success(response: response);

        return Success(response: response);
      }
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: jsonDecoded['message']);
    }on HttpException {
      return Failure(code: NO_INTERNET,errorResponse:"Internal server error");
    } on FormatException {
      return Failure(code: USER_INVALID_RESPONSE,errorResponse:"Invalid format");
    }on SocketException {
      throw Exception("No internet connection");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR,errorResponse:e);

    }



  }

Future<Object> updateProductRate({required productId,required rate})async{

  try{

    var body = json.encode({
      'productId': productId,
      'rate':rate
    });
    var url = Uri.parse("${dotenv.env['RATE_PRODUCT']}");
    final response = await client.put(url, headers: {'Content-Type': 'application/json'}, body: body);
    final Map<String,dynamic> jsonDecoded = json.decode(response.body);

    if (jsonDecoded['status'] == true) {

      Success(response: response);

      return Success(response: response);
    }
    return Failure(code: USER_INVALID_RESPONSE, errorResponse: jsonDecoded['message']);
  }on HttpException {
    return Failure(code: NO_INTERNET,errorResponse:"Internal server error");
  } on FormatException {
    return Failure(code: USER_INVALID_RESPONSE,errorResponse:"Invalid format");
  }on SocketException {
    throw Exception("No internet connection");
  } catch (e) {
    return Failure(code: UNKNOWN_ERROR,errorResponse:e);

  }



}

Future<Object> deleteProduct({required productId})async{

  try{
    String userId = await UserPreferences().getUserId();

    var body = json.encode({
      'productId': productId,
      'productOwnerId':userId
    });
    var url = Uri.parse("${dotenv.env['DELETE_PRODUCT']}");
    final response = await client.put(url, headers: {'Content-Type': 'application/json'}, body: body);
    final Map<String,dynamic> jsonDecoded = json.decode(response.body);

    if (jsonDecoded['status'] == true) {

      Success(response: response);

      return Success(response: response);
    }
    return Failure(code: USER_INVALID_RESPONSE, errorResponse: jsonDecoded['message']);
  }on HttpException {
    return Failure(code: NO_INTERNET,errorResponse:"Internal server error");
  } on FormatException {
    return Failure(code: USER_INVALID_RESPONSE,errorResponse:"Invalid format");
  }on SocketException {
    throw Exception("No internet connection");
  } catch (e) {
    return Failure(code: UNKNOWN_ERROR,errorResponse:e);

  }



}
  Future<List<ProductModal>> fetchProductsTypes({required productType}) async {
    try{
      var url = Uri.parse("${dotenv.env['GET_PRODUCT_TYPE']}$productType");

      final response = await client.get(url);
      final Map<String, dynamic> jsonDecoded = json.decode(response.body);
      if (jsonDecoded['status'] == true) {

        final List<dynamic> responseData = jsonDecoded['data'];

        final product = responseData.map((json) => ProductModal.fromJson(json)).toList();


        return product;
      }
      throw notifyFlutterToastError(title:errorText);

    }catch(e){
      throw notifyFlutterToastError(title:errorText);
    }
  }


  Future<Object> listProduct()async{

    try{
      var result = await UserPreferences().getUser();
      var body = json.encode({
        'productName':productName,
        'productType':productType,
        'productSize':productSize,
        'productOwnerId':result.userId,
        'productOwnerFirstName':result.firstName,
        'productOwnerLastName':result.lastName,
        'productStock':productStock,
        'productPrice':productPrice,
        'productImageUrl':productImageUrl,

      });
      var url = Uri.parse("${dotenv.env['ADD_PRODUCT']}");
      final response = await client.post(url, headers: {'Content-Type': 'application/json'}, body: body);
      final Map<String,dynamic> jsonDecoded = json.decode(response.body);

      if (jsonDecoded['status'] == true) {

        Success(response: response);

        return Success(response: response);
      }
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: jsonDecoded['message']);
    }on HttpException {
      return Failure(code: NO_INTERNET,errorResponse:"Internal server error");
    } on FormatException {
      return Failure(code: USER_INVALID_RESPONSE,errorResponse:"Invalid format");
    }on SocketException {
      throw Exception("No internet connection");
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR,errorResponse:e);

    }



  }




  }

