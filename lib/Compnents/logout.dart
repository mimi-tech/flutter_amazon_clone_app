import 'package:amazon_clone_new/Util/sharedPrefrences.dart';
import 'package:amazon_clone_new/screens/loginScreen.dart';
import 'package:get/get.dart';

class LogOutUser{
  logoutUser() {
    UserPreferences().removeUser();
    Get.off(() => LoginScreen());
  }
}