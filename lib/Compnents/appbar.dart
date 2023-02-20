import 'package:amazon_clone_new/Util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GeneralAppbar extends StatefulWidget with PreferredSizeWidget{
  const GeneralAppbar({Key? key, required this.title, required this.color}) : super(key: key);
  final String title;
  final Color color;
  @override
  _GeneralAppbarState createState() => _GeneralAppbarState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);

}

class _GeneralAppbarState extends State<GeneralAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon:Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: widget.color,
      title: Text(widget.title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kWhiteColor),
      ),
    );
  }
}


