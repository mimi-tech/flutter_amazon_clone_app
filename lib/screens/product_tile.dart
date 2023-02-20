import 'package:amazon_clone_new/Compnents/general_button.dart';
import 'package:amazon_clone_new/Controllers/cart_controller.dart';
import 'package:amazon_clone_new/Controllers/auth_controller.dart';
import 'package:amazon_clone_new/Controllers/product_c.dart';
import 'package:amazon_clone_new/Models/product_modal.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/screens/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  final ProductModal product;
    ProductTile(this.product, {Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.bottomSheet(
          Container(
            color: kWhiteColor,

              child:ProductDetails(product)
          ),
          barrierColor: Colors.black12,
          isDismissible: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35),),
          enableDrag: true,

        );
      },


      child: Card(
        //color: Colors.white70,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.productImageUrl.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),


                  Positioned(
                    right: 0,
                    child:Material(

                      child:  product.productStock! > 0
                            ? Text("+ ${product.productStock.toString()}",
                            style:Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold)

                        )
                            : Text("0",
                            style:Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold)

                        )


                    )),

                ],
              ),
              const SizedBox(height: 8),
              Text(product.productName.toString(),
                  style:Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold)

              ),
              const SizedBox(height: 8),
              if (product.productRate != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   InkWell(
                     onTap: (){
                     //productController.toggleRateStatus();
                       Get.defaultDialog(
                         title: product.productName.toString(),
                         backgroundColor: kWhiteColor,
                         titleStyle: Theme.of(context).textTheme.bodyText1,
                           confirm: GeneralButton(title: "Ok", color: kNavyColor, tapSmsButton: (){
                             Get.back();
                             productController.toggleRateStatus(product);
                           }),
                           content:RatingBar.builder(
                             initialRating: 1,
                             minRating: 1,
                             direction: Axis.horizontal,
                             allowHalfRating: true,
                             itemCount: 5,
                             itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                             itemBuilder: (context, _) =>
                             const Icon(Icons.star, color: Colors.amber,),

                             onRatingUpdate: (double value) {  },

                           )
                       );
                     },
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         const Icon(Icons.star,color: Colors.amber,),
                         Text(
                           product.productRate.toString(),
                           style: Theme.of(context).textTheme.subtitle1,
                         ),

                       ],
                     ),
                   ),

                   InkWell(
                     onTap: (){
                       productController.getProductsLike(productId: product.productId);
                       productController.toggleFavouriteStatus(product);
                     },
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                          product.isFavourite?
                         const Icon(Icons.favorite_rounded,color: kOrangeColor,)
                          :const Icon(Icons.favorite_border,color: kOrangeColor,),
                         Text(
                           product.productLike.toString(),
                           style: Theme.of(context).textTheme.subtitle1
                         ),

                       ],
                     ),
                   ),

                  IconButton(onPressed: (){productController.deleteProduct(product);}, icon: const Icon(Icons.delete,color: kRedColor,)),

                 ],
                ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.productPrice != null?'\$${product.productPrice}':'\$1000',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.cyan,fontWeight: FontWeight.bold)),
               GeneralButton(title: "Buy", color: kNavyColor2, tapSmsButton: (){
                 cartController.addItemToCart(product);
               })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}