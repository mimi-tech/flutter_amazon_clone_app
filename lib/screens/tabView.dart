
import 'package:amazon_clone_new/Controllers/cart_controller.dart';
import 'package:amazon_clone_new/Controllers/order_c.dart';
import 'package:amazon_clone_new/Controllers/product_c.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:amazon_clone_new/Util/dimen.dart';
import 'package:amazon_clone_new/Util/sharedPrefrences.dart';
import 'package:amazon_clone_new/screens/cartScreen.dart';
import 'package:amazon_clone_new/screens/listProduct.dart';
import 'package:amazon_clone_new/screens/orderScreen.dart';
import 'package:amazon_clone_new/screens/productScreen.dart';
import 'package:amazon_clone_new/screens/profile.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class ProductTabView extends StatefulWidget {

   ProductTabView({Key? key}) : super(key: key);


  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  final ProductController controller = Get.put(ProductController());
  final OrderController orderController = Get.put(OrderController());


  final cartController = Get.put(CartController());
  List<String> productTypes = ["All","Shoes","Clothes","Books","Phones"];
  var firstName = "";
  List<PopupMenuEntry> list =  <PopupMenuEntry>[];
  List<PopupMenuEntry> getProductTypes(){
    list.clear();
  for(var i = 0; i < productTypes.length; i++){
  final w =  PopupMenuItem(
    onTap: (){
      if(productTypes[i] == "All"){
         controller.getProducts();
      }else{
      controller.updateProductTypeTile(productTypes[i]);
      controller.getProductsType(productType: productTypes[i]);
    }},
  child: Text(productTypes[i]),
  value: productTypes[i],
  );list.add(w);

  }
  return list;
  }


  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      length: 5,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: kDarkBlue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
              () => Text(controller.productTypeTitle.toString(), style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kWhiteColor))),


    Obx(
    () => Text(controller.firstName.toString(), style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kWhiteColor))),

              PopupMenuButton(

                  itemBuilder: (context) => getProductTypes(),

                  child: const Icon(Icons.more_vert)

              ),



            ],
          ),

          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: const Color(0xFFB6B6B6),
            indicatorColor: kOrangeColor,
            labelColor:kOrangeColor,
            labelStyle: GoogleFonts.rajdhani(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFB6B6B6),
                  fontSize: kFontSize14.sp
              ),
            ),
            tabs:  [
              const Tab(
                icon: Icon(Icons.business),
                text: "Products",
              ),



              Tab(
                icon:Badge(
                  badgeContent:  Obx(() => Text(cartController.cartCount.toString())),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add_shopping_cart),
                  ),
                ),
                text: "My Cart",
              ),

              Tab(
                icon:Badge(
                  badgeContent:  Obx(() => Text(orderController.orderCount.toString())),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.monetization_on),
                  ),
                ),
                text: "My Orders",
              ),

              const Tab(
                icon:  Icon(Icons.add),
                text: "List products",
              ),

              const Tab(
                icon:  Icon(Icons.person),
                text: "Profile",
              ),


            ],
          ),
        ),
        body:  TabBarView(
          children: [
            ProductScreen(),

            CartScreen(),
            OrderScreen(),

            ProductListingScreen(),

            const ProfileScreen(),

          ],
        ),
      ),
    );
  }
}
