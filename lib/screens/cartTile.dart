import 'package:amazon_clone_new/Controllers/cart_controller.dart';
import 'package:amazon_clone_new/Models/cart_item.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  CartTile(this.cartItem, {Key? key}) : super(key: key);

  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
      Container(
        color: kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [

              IconButton(onPressed: (){
                cartController.decrement();
                cartController.removeItem(cartItem.productId);

                }, icon:const Icon(Icons.cancel,color: kRedColor,)),

              SizedBox(
                height: 50,
                width: 50,
                child: Image.network(
                  cartItem.productImageUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
             const SizedBox(width: 10),

           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(cartItem.productName.toUpperCase(), style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kNavyColor,fontWeight: FontWeight.bold)),

               Text(cartItem.productBrand, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: const Color(0xFFc3c3c3))),

               Text("${cartItem.productSize.toUpperCase()} inches", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: const Color(0xFFc2c2c2))),

               Text(cartItem.productPrice.toString(), style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Colors.cyan)),

             ],
           ),
              const Spacer(),

              Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){cartController.increaseQuantity(cartItem);}, icon:const Icon(Icons.add_circle_outline,color: kOrangeColor,)),
                      IconButton(onPressed: (){cartController.decreaseQuantity(cartItem);}, icon:const Icon(Icons.remove_circle_outline,color: kOrangeColor,))

                    ],
                  ),

                  Text("${cartItem.productQuantity.toString()} x ${cartItem.productPrice.toString()}", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.cyan)),
                ],
              ),

            ],
          ),
        ),
      ),



      ],
    );
  }
}
