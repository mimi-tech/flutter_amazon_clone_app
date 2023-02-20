import 'package:amazon_clone_new/Controllers/order_c.dart';
import 'package:amazon_clone_new/Models/order_modal.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orderModel;
  OrderTile(this.orderModel, {Key? key}) : super(key: key);

  final orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: kBlackColor),
          Container(
            color: kWhiteColor,
            child: Row(
              children: [

                Text(DateFormat('dd/MM/yyyy hh:mma').format(DateTime.parse(orderModel.dateTime)).toString(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kOrangeColor,fontWeight: FontWeight.bold),
                ),
              const  Spacer(),
                Text("₦${orderModel.amount.toString()}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),



          ListView(
            shrinkWrap: true,
          children:orderModel.products.map((product) => Container(
          color: kWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [





                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        product.productImageUrl.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.productName.toUpperCase(), style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kNavyColor,fontWeight: FontWeight.bold)),

                        Text(product.productBrand, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: const Color(0xFFc3c3c3))),

                        Text("${product.productSize.toUpperCase()} inches", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: const Color(0xFFc2c2c2))),

                        Text(product.productPrice.toString(), style: Theme.of(context).textTheme.subtitle1!.copyWith(color:Colors.cyan)),

                      ],
                    ),
                    const Spacer(),

                    Column(
                      children: [

                        Text("${product.productQuantity.toString()} x ${product.productPrice.toString()}", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.cyan)),
                      ],
                    ),

                  ],
                ),

              ],
            ),
          ),

   )).toList()
    ),



        ],
      ),
    );
}}
