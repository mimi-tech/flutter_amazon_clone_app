import 'package:amazon_clone_new/Controllers/cart_controller.dart';
import 'package:amazon_clone_new/Controllers/order_c.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/Util/dimen.dart';
import 'package:amazon_clone_new/screens/cartTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  final OrderController orderController = Get.put(OrderController());




  @override
  Widget build(BuildContext context) {

    return SafeArea(child:Scaffold(
      bottomNavigationBar: CartController.items.isEmpty?
     const Text("")
          :Container(
        margin: const EdgeInsets.symmetric(horizontal: kMargin),
        height: 130.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color:Color(0xFFc2c2c2),thickness: 2.0),
            Text("Total".toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kOrangeColor,fontWeight: FontWeight.bold),
            ),
      Obx(() =>Text("₦${cartController.totalPrice.toString()}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: (){

                orderController.addOrder(cartProducts: CartController.items.toList(), total: cartController.totalPrice.toString());
                orderController.increment();
                cartController.clear();

                Get.snackbar(
                  "Orders",
                  "Orders Placed successfully. Thank you",
                  backgroundColor: kNavyColor,
                  colorText: kRedColor,
                  snackPosition: SnackPosition.BOTTOM,
                  forwardAnimationCurve: Curves.bounceIn,
                  reverseAnimationCurve: Curves.easeInOut,
                  dismissDirection: DismissDirection.up,

                );
              },
              style: ButtonStyle(

                backgroundColor: MaterialStateProperty.all<Color>(kOrangeColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),

                      )
                  )
              ),
              child:Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Check Out".toUpperCase(),
                  style: Theme.of(context).textTheme.button,
                ),
              )


        ),
            )          ],
        ),
      ),
        backgroundColor: const Color(0xFFf9f9f9),
        body: GetBuilder<CartController>(
            builder: (_) => Column(
              children: [
                Obx(() => CartController.items.isEmpty?
                Center(
                    child: Text("Your cart is empty",
                        style:Theme.of(context).textTheme.bodyText1))
                    :Expanded(
                  child:  ListView.builder(
        itemCount: CartController.items.length,
        itemBuilder: (context, index) => CartTile(CartController.items[index],))





                  ),
                ),



              ],
            )
        )));
  }
}
