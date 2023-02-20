import 'package:amazon_clone_new/Models/cart_item.dart';
import 'package:amazon_clone_new/Models/order_modal.dart';
import 'package:get/get.dart';


class OrderController extends GetxController {

  var orderCount = 0.obs;

  final _orders = [].obs;

  List<OrderModel> get orders {
    return [..._orders];
  }

  increment() => orderCount++;
  decrement() => orderCount--;
  void addOrder({required List<CartItem> cartProducts,  required total}) {
    _orders.insert(
        0,
        OrderModel(
            orderId: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            dateTime: DateTime.now().toString()));
    update();
  }

  void removeOrder(String orderId) {

    orders.removeWhere((element) => element.orderId == orderId);
    update();
  }

}
//"₦"