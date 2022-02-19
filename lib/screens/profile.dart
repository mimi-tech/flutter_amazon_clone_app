import 'package:amazon_clone1/Compnents/general_button.dart';
import 'package:amazon_clone1/Compnents/logout.dart';
import 'package:amazon_clone1/Util/colors.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralButton(
      tapSmsButton: (){LogOutUser().logoutUser();},
      title: "Logout",
      color: kRedColor,
    );
  }
}
