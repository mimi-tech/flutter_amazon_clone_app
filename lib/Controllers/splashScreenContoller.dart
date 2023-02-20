import 'dart:async';

import 'package:amazon_clone_new/Util/sharedPrefrences.dart';
import 'package:amazon_clone_new/screens/loginScreen.dart';
import 'package:amazon_clone_new/screens/tabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoAnimationController extends GetxController with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? animation;

  final duration = const Duration(milliseconds: 1000);

  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    String userId = await UserPreferences().getUserId();
    print("This is userId $userId");
    if (userId == "") {
      Get.off(() => LoginScreen());
    } else {
      Get.off(() =>  ProductTabView());
    }
  }

  @override
  void onInit() {
    super.onInit();

    _animationController = AnimationController(
        vsync:this,
        value: 0.1,

        duration: const Duration(seconds: 4));
    animation =
    CurvedAnimation(parent: _animationController!, curve: Curves.easeOut);

    animation!.addListener(() => update());
    _animationController!.forward();



    startTime();
  }


  @override
  void onClose() {
    super.onClose();

    _animationController!.dispose();
  }
}
