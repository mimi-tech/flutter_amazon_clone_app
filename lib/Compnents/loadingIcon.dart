import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressHUDFunction extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final bool dismissible;
  final Widget child;

  ProgressHUDFunction({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.dismissible = false,
    required this.child,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      Widget layOutProgressIndicator;
      layOutProgressIndicator = Platform.isIOS?Center(child: CupertinoActivityIndicator(
        animating: true,
        radius: 30,
      )) :Center(child: progressIndicator);
      final modal = [
        new Opacity(
          child: new ModalBarrier(dismissible: dismissible, color: color),
          opacity: opacity,
        ),
        layOutProgressIndicator
      ];
      widgetList += modal;
    }
    return new Stack(
      children: widgetList,
    );
  }
}


class CupertinoProgressHud extends StatelessWidget {
  const CupertinoProgressHud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CupertinoActivityIndicator(
      animating: true,
      radius: 30,
    ));
  }
}
