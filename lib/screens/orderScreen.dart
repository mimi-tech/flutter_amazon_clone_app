import 'package:amazon_clone_new/Controllers/order_c.dart';

import 'package:amazon_clone_new/screens/orderTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:Scaffold(


        backgroundColor: const Color(0xFFf9f9f9),
        body: GetBuilder<OrderController>(
            builder: (_) => Column(
              children: [
                Obx(() => orderController.orders.isEmpty? Center(
                    child: Text(AppLocalizations.of(context)!.noOrder,
                    style:Theme.of(context).textTheme.bodyText1)):Expanded(
                    child:  ListView.builder(
                        itemCount: orderController.orders.length,
                        itemBuilder: (context, index) => OrderTile(orderController.orders[index],))





                ),
                ),



              ],
            )
        )));
  }
}
