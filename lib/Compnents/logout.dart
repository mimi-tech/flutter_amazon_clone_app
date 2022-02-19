import 'package:amazon_clone1/Util/sharedPrefrences.dart';
import 'package:amazon_clone1/screens/loginScreen.dart';
import 'package:get/get.dart';

class LogOutUser{
  logoutUser() {
    UserPreferences().removeUser();
    Get.off(() => LoginScreen());
  }
}