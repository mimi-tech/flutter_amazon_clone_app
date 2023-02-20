import 'package:amazon_clone_new/Controllers/product_c.dart';
import 'package:amazon_clone_new/Util/colors.dart';

import 'package:amazon_clone_new/screens/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({Key? key}) : super(key: key);
   final ProductController productController = Get.put(ProductController());




  @override
  Widget build(BuildContext context) {

    return SafeArea(child:Scaffold(
      backgroundColor: Colors.white38,
      body: GetBuilder<ProductController>(
    builder: (_) => Column(
        children: [
          productController.isRegLoading?const Center(child: CircularProgressIndicator(color: kNavyColor2,)): Expanded(
            child: AlignedGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 4,
         itemCount: productController.allProducts.length,
                itemBuilder: (context, index) {
                  return ProductTile(productController.allProducts[index]);


                }


    ),
          ),



        ],
      )
    )));
  }
}
