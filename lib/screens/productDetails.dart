import 'package:amazon_clone_new/Compnents/general_button.dart';
import 'package:amazon_clone_new/Controllers/product_c.dart';
import 'package:amazon_clone_new/Models/product_modal.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/Util/dimen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final ProductModal product;
  ProductDetails(this.product, {Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kMargin,vertical: kMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(product.productName.toString().toUpperCase(),
                  style:Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold,color: Colors.orange)

              ),
            ),
           const SizedBox(height: 20),

            Headings(title: "Product name: ",description: product.productName.toString()),
            Headings(title: "Product size: ",description: "${product.productSize.toString()} inches"),
            Headings(title: "Product stock: ",description: product.productStock.toString()),
            Headings(title: "Product owner: ",description: "${product.productOwnerFirstName.toString()} ${product.productOwnerLastName.toString()} store"),
            Headings(title: "Date Listed: ",description: product.dateAdded.toString()),
            const SizedBox(height: 20),
          Center(child: GeneralButton(title: "Done", color: kNavyColor, tapSmsButton:() =>Get.back()))
          ],
        ),
      ),
    );
  }}


  class Headings extends StatelessWidget {
    const Headings({Key? key, required this.title,required this.description}) : super(key: key);
     final String title;
     final String description;
    @override
    Widget build(BuildContext context) {
      return  Padding(
        padding: const EdgeInsets.all(12.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kTextColor,fontWeight: FontWeight.w500),

              children: <TextSpan>[
                TextSpan(
                  text: description,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kNavyColor,fontWeight: FontWeight.bold),
                ),


              ]

          ),
        ),
      );
    }
  }
