import 'package:amazon_clone_new/Controllers/splashScreenContoller.dart';
import 'package:amazon_clone_new/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SplashScreenAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LogoAnimationController());
  }
}




class CustomAnimatedWidget extends StatelessWidget {
   CustomAnimatedWidget({Key? key}) : super(key: key);
  final controller = Get.put(LogoAnimationController());
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LogoAnimationController>(
      builder: (newController) {
        return SafeArea(child: Scaffold(
          body:  Container(

              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/splash_bg.png'),
                    fit: BoxFit.cover,)),

              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Amazon clone'.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kWhiteColor,fontWeight: FontWeight.bold)
                      ),

                    ],),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_shopping_cart,size: newController.animation!.value * 250,color: kWhiteColor,)
                    ],
                  ),
                ],
              )

          ),
        ));

      },
    );
  }
}