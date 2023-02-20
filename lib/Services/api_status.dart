import 'package:amazon_clone_new/Models/product_modal.dart';

class Success{
  int? code;
  Object? response;
  Success({this.code, this.response});
}

class Failure{
  int? code;
  Object? errorResponse;
  Failure({this.code, this.errorResponse});
}
